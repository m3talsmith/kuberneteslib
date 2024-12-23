import 'package:kuberneteslib/src/spec/label_selector.dart';
import 'package:kuberneteslib/src/spec/label_selector_requirement.dart';
import 'package:kuberneteslib/src/spec/pod_affinity_term.dart';
import 'package:kuberneteslib/src/spec/weighted_pod_affinity_term.dart';
import 'package:test/test.dart';

void main() {
  group('WeightedPodAffinityTerm', () {
    test('can be instantiated', () {
      final weightedTerm = WeightedPodAffinityTerm();
      expect(weightedTerm, isNotNull);
    });

    test('can be instantiated with values', () {
      final podAffinityTerm = PodAffinityTerm()
        ..topologyKey = 'kubernetes.io/hostname'
        ..labelSelector = (LabelSelector()
          ..matchExpressions = [
            LabelSelectorRequirement()
              ..key = 'app'
              ..operator = 'In'
              ..values = ['cache']
          ]);

      final weightedTerm = WeightedPodAffinityTerm()
        ..weight = 100
        ..podAffinityTerm = podAffinityTerm;

      expect(weightedTerm.weight, equals(100));
      expect(weightedTerm.podAffinityTerm, equals(podAffinityTerm));
    });

    group('json', () {
      test('toJson returns correct map', () {
        final podAffinityTerm = PodAffinityTerm()
          ..topologyKey = 'kubernetes.io/hostname'
          ..labelSelector = (LabelSelector()
            ..matchExpressions = [
              LabelSelectorRequirement()
                ..key = 'app'
                ..operator = 'In'
                ..values = ['cache']
            ]);

        final weightedTerm = WeightedPodAffinityTerm()
          ..weight = 100
          ..podAffinityTerm = podAffinityTerm;

        final json = weightedTerm.toJson();
        final deserialized = WeightedPodAffinityTerm.fromJson(json);

        expect(deserialized.toJson(), equals(json));
      });

      test('toJson omits null values', () {
        final weightedTerm = WeightedPodAffinityTerm()..weight = 50;

        final json = weightedTerm.toJson();

        expect(json, {
          'weight': 50,
        });
        expect(json.containsKey('podAffinityTerm'), isFalse);
      });
    });
  });
}
