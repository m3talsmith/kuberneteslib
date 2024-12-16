import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/affinity.dart';
import 'package:kuberneteslib/src/spec/node_selector.dart';
import 'package:kuberneteslib/src/spec/pod_affinity_term.dart';
import 'package:kuberneteslib/src/spec/weighted_pod_affinity_term.dart';
import 'package:kuberneteslib/src/spec/preferred_scheduling_term.dart';

void main() {
  group('AffinityKind', () {
    test('fromString creates correct enum values', () {
      expect(AffinityKind.fromString('nodeAffinity'),
          equals(AffinityKind.nodeAffinity));
      expect(AffinityKind.fromString('podAffinity'),
          equals(AffinityKind.podAffinity));
      expect(AffinityKind.fromString('podAntiAffinity'),
          equals(AffinityKind.podAntiAffinity));
      expect(AffinityKind.fromString('invalid'), equals(AffinityKind.unknown));
    });
  });

  group('NodeAffinity', () {
    test('serializes to JSON correctly', () {
      final nodeAffinity = NodeAffinity()
        ..preferredDuringSchedulingIgnoredDuringExecution = [
          PreferredSchedulingTerm()..weight = 1
        ]
        ..requiredDuringSchedulingIgnoredDuringExecution = NodeSelector();

      final json = nodeAffinity.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(
          json['preferredDuringSchedulingIgnoredDuringExecution'], isNotNull);
      expect(json['requiredDuringSchedulingIgnoredDuringExecution'], isNotNull);
    });

    test('deserializes from JSON correctly', () {
      final json = {
        'preferredDuringSchedulingIgnoredDuringExecution': [
          {'weight': 1}
        ],
        'requiredDuringSchedulingIgnoredDuringExecution': {
          'nodeSelectorTerms': []
        }
      };

      final nodeAffinity = NodeAffinity.fromJson(json);

      expect(nodeAffinity, isA<NodeAffinity>());
      expect(nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution,
          isNotNull);
      expect(nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution,
          isNotNull);
    });
  });

  group('PodAffinity', () {
    test('serializes to JSON correctly', () {
      final podAffinity = PodAffinity()
        ..preferredDuringSchedulingIgnoredDuringExecution = [
          WeightedPodAffinityTerm()..weight = 1
        ]
        ..requiredDuringSchedulingIgnoredDuringExecution = [PodAffinityTerm()];

      final json = podAffinity.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(
          json['preferredDuringSchedulingIgnoredDuringExecution'], isNotNull);
      expect(json['requiredDuringSchedulingIgnoredDuringExecution'], isNotNull);
    });

    test('deserializes from JSON correctly', () {
      final json = {
        'preferredDuringSchedulingIgnoredDuringExecution': [
          {'weight': 1}
        ],
        'requiredDuringSchedulingIgnoredDuringExecution': []
      };

      final podAffinity = PodAffinity.fromJson(json);

      expect(podAffinity, isA<PodAffinity>());
      expect(podAffinity.preferredDuringSchedulingIgnoredDuringExecution,
          isNotNull);
      expect(podAffinity.requiredDuringSchedulingIgnoredDuringExecution,
          isNotNull);
    });
  });

  group('PodAntiAffinity', () {
    test('serializes to JSON correctly', () {
      final podAntiAffinity = PodAntiAffinity()
        ..preferredDuringSchedulingIgnoredDuringExecution = [
          WeightedPodAffinityTerm()..weight = 1
        ]
        ..requiredDuringSchedulingIgnoredDuringExecution = [PodAffinityTerm()];

      final json = podAntiAffinity.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(
          json['preferredDuringSchedulingIgnoredDuringExecution'], isNotNull);
      expect(json['requiredDuringSchedulingIgnoredDuringExecution'], isNotNull);
    });

    test('deserializes from JSON correctly', () {
      final json = {
        'preferredDuringSchedulingIgnoredDuringExecution': [
          {'weight': 1}
        ],
        'requiredDuringSchedulingIgnoredDuringExecution': []
      };

      final podAntiAffinity = PodAntiAffinity.fromJson(json);

      expect(podAntiAffinity, isA<PodAntiAffinity>());
      expect(podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution,
          isNotNull);
      expect(podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution,
          isNotNull);
    });
  });

  group('AffinityConverter', () {
    const converter = AffinityConverter();

    test('converts NodeAffinity correctly', () {
      final json = {
        'nodeAffinity': {'nodeSelectorTerms': []}
      };
      final affinity = converter.fromJson(json);
      expect(affinity, isA<NodeAffinity>());
    });
  });
}
