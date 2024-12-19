import 'package:kuberneteslib/src/spec/label_selector_requirement.dart';
import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/affinity.dart';
import 'package:kuberneteslib/src/spec/node_selector.dart';
import 'package:kuberneteslib/src/spec/node_selector_term.dart';
import 'package:kuberneteslib/src/spec/node_selector_requirement.dart';
import 'package:kuberneteslib/src/spec/pod_affinity_term.dart';
import 'package:kuberneteslib/src/spec/preferred_scheduling_term.dart';
import 'package:kuberneteslib/src/spec/weighted_pod_affinity_term.dart';
import 'package:kuberneteslib/src/spec/label_selector.dart';

void main() {
  group('Affinity', () {
    test('can create base Affinity', () {
      final affinity = Affinity();
      expect(affinity, isNotNull);
    });

    test('throws on unknown affinity kind', () {
      final json = {'kind': 'unknownKind'};
      expect(() => Affinity.fromJson(json), throwsException);
    });
  });

  group('NodeAffinity', () {
    test('can create empty NodeAffinity', () {
      final nodeAffinity = NodeAffinity();
      expect(nodeAffinity, isNotNull);
      expect(
          nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution, isNull);
      expect(
          nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution, isNull);
    });

    test('can serialize and deserialize NodeAffinity', () {
      final nodeAffinity = NodeAffinity()
        ..requiredDuringSchedulingIgnoredDuringExecution = (NodeSelector()
          ..nodeSelectorTerms = [
            NodeSelectorTerm()
              ..matchExpressions = [
                NodeSelectorRequirement()
                  ..key = 'kubernetes.io/e2e-az-name'
                  ..operator = 'In'
                  ..values = ['e2e-az1', 'e2e-az2']
              ]
          ])
        ..preferredDuringSchedulingIgnoredDuringExecution = [
          PreferredSchedulingTerm()
            ..weight = 1
            ..preference = (NodeSelectorTerm()
              ..matchExpressions = [
                NodeSelectorRequirement()
                  ..key = 'another-node-label-key'
                  ..operator = 'In'
                  ..values = ['another-node-label-value']
              ])
        ];

      final json = nodeAffinity.toJson();
      final deserializedAffinity = NodeAffinity.fromJson(json);

      expect(
          deserializedAffinity.requiredDuringSchedulingIgnoredDuringExecution
              ?.nodeSelectorTerms?[0].matchExpressions?[0].key,
          equals('kubernetes.io/e2e-az-name'));
      expect(
          deserializedAffinity
              .preferredDuringSchedulingIgnoredDuringExecution?.first.weight,
          equals(1));
    });
  });

  group('PodAffinity', () {
    test('can create empty PodAffinity', () {
      final podAffinity = PodAffinity();
      expect(podAffinity, isNotNull);
      expect(
          podAffinity.preferredDuringSchedulingIgnoredDuringExecution, isNull);
      expect(
          podAffinity.requiredDuringSchedulingIgnoredDuringExecution, isNull);
    });

    test('can serialize and deserialize PodAffinity', () {
      final podAffinity = PodAffinity()
        ..requiredDuringSchedulingIgnoredDuringExecution = [
          PodAffinityTerm()
            ..labelSelector = (LabelSelector()
              ..matchLabels = {
                'app': LabelSelectorRequirement(
                    key: 'app', operator: 'In', values: ['frontend'])
              })
            ..topologyKey = 'kubernetes.io/hostname'
        ]
        ..preferredDuringSchedulingIgnoredDuringExecution = [
          WeightedPodAffinityTerm()
            ..weight = 100
            ..podAffinityTerm = (PodAffinityTerm()
              ..labelSelector = (LabelSelector()
                ..matchLabels = {
                  'app': LabelSelectorRequirement(
                      key: 'app', operator: 'In', values: ['backend'])
                })
              ..topologyKey = 'kubernetes.io/hostname')
        ];

      final json = podAffinity.toJson();
      final deserializedAffinity = PodAffinity.fromJson(json);

      expect(
          deserializedAffinity
              .requiredDuringSchedulingIgnoredDuringExecution?[0]
              .labelSelector
              ?.matchLabels?['app']
              ?.key,
          equals('app'));
      expect(
          deserializedAffinity
              .requiredDuringSchedulingIgnoredDuringExecution?[0]
              .labelSelector
              ?.matchLabels?['app']
              ?.operator,
          equals('In'));
      expect(
          deserializedAffinity
              .requiredDuringSchedulingIgnoredDuringExecution?[0]
              .labelSelector
              ?.matchLabels?['app']
              ?.values,
          equals(['frontend']));
      expect(
          deserializedAffinity
              .preferredDuringSchedulingIgnoredDuringExecution?[0].weight,
          equals(100));
    });
  });

  group('PodAntiAffinity', () {
    test('can create empty PodAntiAffinity', () {
      final podAntiAffinity = PodAntiAffinity();
      expect(podAntiAffinity, isNotNull);
      expect(podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution,
          isNull);
      expect(podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution,
          isNull);
    });

    test('can serialize and deserialize PodAntiAffinity', () {
      final podAntiAffinity = PodAntiAffinity()
        ..requiredDuringSchedulingIgnoredDuringExecution = [
          PodAffinityTerm()
            ..labelSelector = (LabelSelector()
              ..matchLabels = {
                'app': LabelSelectorRequirement(
                    key: 'app', operator: 'In', values: ['database'])
              })
            ..topologyKey = 'kubernetes.io/hostname'
        ]
        ..preferredDuringSchedulingIgnoredDuringExecution = [
          WeightedPodAffinityTerm()
            ..weight = 50
            ..podAffinityTerm = (PodAffinityTerm()
              ..labelSelector = (LabelSelector()
                ..matchLabels = {
                  'app': LabelSelectorRequirement(
                      key: 'app', operator: 'In', values: ['cache'])
                })
              ..topologyKey = 'kubernetes.io/hostname')
        ];

      final json = podAntiAffinity.toJson();
      final deserializedAffinity = PodAntiAffinity.fromJson(json);

      expect(
          deserializedAffinity
              .requiredDuringSchedulingIgnoredDuringExecution?[0]
              .labelSelector
              ?.matchLabels?['app']
              ?.key,
          equals('app'));
      expect(
          deserializedAffinity
              .requiredDuringSchedulingIgnoredDuringExecution?[0]
              .labelSelector
              ?.matchLabels?['app']
              ?.operator,
          equals('In'));
      expect(
          deserializedAffinity
              .requiredDuringSchedulingIgnoredDuringExecution?[0]
              .labelSelector
              ?.matchLabels?['app']
              ?.values,
          equals(['database']));
      expect(
          deserializedAffinity
              .preferredDuringSchedulingIgnoredDuringExecution?[0].weight,
          equals(50));
    });
  });

  group('AffinityConverter', () {
    final converter = const AffinityConverter();

    test('can convert NodeAffinity', () {
      final nodeAffinity = NodeAffinity()
        ..requiredDuringSchedulingIgnoredDuringExecution = (NodeSelector()
          ..nodeSelectorTerms = [
            NodeSelectorTerm()
              ..matchExpressions = [
                NodeSelectorRequirement()
                  ..key = 'test-key'
                  ..operator = 'In'
                  ..values = ['test-value']
              ]
          ]);

      final json = converter.toJson(nodeAffinity);
      final result = converter.fromJson({'nodeAffinity': json});

      expect(result, isA<NodeAffinity>());
    });

    test('can convert PodAffinity', () {
      final podAffinity = PodAffinity()
        ..requiredDuringSchedulingIgnoredDuringExecution = [
          PodAffinityTerm()
            ..labelSelector = (LabelSelector()
              ..matchLabels = {
                'app': LabelSelectorRequirement(
                    key: 'app', operator: 'In', values: ['test'])
              })
            ..topologyKey = 'kubernetes.io/hostname'
        ];

      final json = converter.toJson(podAffinity);
      final result = converter.fromJson({'podAffinity': json});

      expect(result, isA<PodAffinity>());
    });

    test('can convert PodAntiAffinity', () {
      final podAntiAffinity = PodAntiAffinity()
        ..requiredDuringSchedulingIgnoredDuringExecution = [
          PodAffinityTerm()
            ..labelSelector = (LabelSelector()
              ..matchLabels = {
                'app': LabelSelectorRequirement(
                    key: 'app', operator: 'In', values: ['test'])
              })
            ..topologyKey = 'kubernetes.io/hostname'
        ];

      final json = converter.toJson(podAntiAffinity);
      final result = converter.fromJson({'podAntiAffinity': json});

      expect(result, isA<PodAntiAffinity>());
    });
  });
}
