import 'package:kuberneteslib/src/spec/label_selector.dart';
import 'package:kuberneteslib/src/spec/label_selector_requirement.dart';
import 'package:kuberneteslib/src/spec/pod_affinity_term.dart';
import 'package:test/test.dart';

void main() {
  group('PodAffinityTerm', () {
    test('can be instantiated', () {
      final term = PodAffinityTerm();
      expect(term, isNotNull);
    });

    test('can be instantiated with all properties', () {
      final term = PodAffinityTerm(
        labelSelector: LabelSelector()
          ..matchLabels = {
            'app': LabelSelectorRequirement(
                key: 'app', operator: 'In', values: ['web'])
          },
        namespaceSelector: LabelSelector()
          ..matchLabels = {
            'env': LabelSelectorRequirement(
                key: 'env', operator: 'In', values: ['prod'])
          },
        namespaces: ['default', 'kube-system'],
        topologyKey: 'kubernetes.io/hostname',
      );

      expect(
          term.labelSelector?.matchLabels?.entries.first.value.toJson(),
          {
            'app': LabelSelectorRequirement(
                key: 'app', operator: 'In', values: ['web'])
          }.entries.first.value.toJson());
      expect(
          term.namespaceSelector?.matchLabels?.entries.first.value.toJson(),
          {
            'env': LabelSelectorRequirement(
                key: 'env', operator: 'In', values: ['prod'])
          }.entries.first.value.toJson());
      expect(term.namespaces, ['default', 'kube-system']);
      expect(term.topologyKey, 'kubernetes.io/hostname');
    });

    group('serialization', () {
      test('toJson() produces correct JSON', () {
        final term = PodAffinityTerm(
          labelSelector: LabelSelector()
            ..matchLabels = {
              'app': LabelSelectorRequirement(
                  key: 'app', operator: 'In', values: ['web'])
            },
          namespaceSelector: LabelSelector()
            ..matchLabels = {
              'env': LabelSelectorRequirement(
                  key: 'env', operator: 'In', values: ['prod'])
            },
          namespaces: ['default', 'kube-system'],
          topologyKey: 'kubernetes.io/hostname',
        );

        final json = term.toJson();

        expect(json, {
          'labelSelector': {
            'matchLabels': {
              'app': LabelSelectorRequirement(
                  key: 'app', operator: 'In', values: ['web']).toJson()
            }
          },
          'namespaceSelector': {
            'matchLabels': {
              'env': LabelSelectorRequirement(
                  key: 'env', operator: 'In', values: ['prod']).toJson()
            }
          },
          'namespaces': ['default', 'kube-system'],
          'topologyKey': 'kubernetes.io/hostname',
        });
      });

      test('fromJson() creates correct instance', () {
        final json = {
          'labelSelector': {
            'matchLabels': {
              'app': LabelSelectorRequirement(
                  key: 'app', operator: 'In', values: ['web']).toJson()
            }
          },
          'namespaceSelector': {
            'matchLabels': {
              'env': LabelSelectorRequirement(
                  key: 'env', operator: 'In', values: ['prod']).toJson()
            }
          },
          'namespaces': ['default', 'kube-system'],
          'topologyKey': 'kubernetes.io/hostname',
        };

        final term = PodAffinityTerm.fromJson(json);

        expect(
            term.labelSelector?.matchLabels?.entries.first.value.toJson(),
            {
              'app': LabelSelectorRequirement(
                  key: 'app', operator: 'In', values: ['web'])
            }.entries.first.value.toJson());
        expect(
            term.namespaceSelector?.matchLabels?.entries.first.value.toJson(),
            {
              'env': LabelSelectorRequirement(
                  key: 'env', operator: 'In', values: ['prod'])
            }.entries.first.value.toJson());
        expect(term.namespaces, ['default', 'kube-system']);
        expect(term.topologyKey, 'kubernetes.io/hostname');
      });

      test('toJson() omits null values', () {
        final term = PodAffinityTerm(
          topologyKey: 'kubernetes.io/hostname',
        );

        final json = term.toJson();

        expect(json, {
          'topologyKey': 'kubernetes.io/hostname',
        });
        expect(json.containsKey('labelSelector'), isFalse);
        expect(json.containsKey('namespaceSelector'), isFalse);
        expect(json.containsKey('namespaces'), isFalse);
      });

      test('handles empty namespaces list', () {
        final term = PodAffinityTerm(
          namespaces: [],
          topologyKey: 'kubernetes.io/hostname',
        );

        final json = term.toJson();
        final decoded = PodAffinityTerm.fromJson(json);

        expect(decoded.namespaces, isEmpty);
      });
    });
  });
}
