import 'package:kuberneteslib/src/spec/label_selector_requirement.dart';
import 'package:kuberneteslib/src/spec/topology_spread_constraint.dart';
import 'package:kuberneteslib/src/spec/label_selector.dart';
import 'package:test/test.dart';

void main() {
  group('TopologySpreadConstraint', () {
    test('can be instantiated', () {
      final constraint = TopologySpreadConstraint();
      expect(constraint, isNotNull);
    });

    test('supports JSON serialization', () {
      final constraint = TopologySpreadConstraint()
        ..maxSkew = 1
        ..topologyKey = 'kubernetes.io/zone'
        ..whenUnsatisfiable = 'DoNotSchedule'
        ..labelSelector = (LabelSelector()
          ..matchLabels = {'app': LabelSelectorRequirement(key: 'web')})
        ..matchLabelKeys = ['app', 'environment']
        ..minDomains = 3
        ..nodeAffinityPolicy = 'Honor'
        ..nodeTaintsPolicy = 'Ignore';

      final json = constraint.toJson();
      final deserialized = TopologySpreadConstraint.fromJson(json);

      expect(deserialized.toJson(), equals(constraint.toJson()));
    });

    test('handles null values correctly', () {
      final constraint = TopologySpreadConstraint();
      final json = constraint.toJson();

      expect(json, isEmpty);

      final deserialized = TopologySpreadConstraint.fromJson(json);
      expect(deserialized.maxSkew, isNull);
      expect(deserialized.topologyKey, isNull);
      expect(deserialized.whenUnsatisfiable, isNull);
      expect(deserialized.labelSelector, isNull);
      expect(deserialized.matchLabelKeys, isNull);
      expect(deserialized.minDomains, isNull);
      expect(deserialized.nodeAffinityPolicy, isNull);
      expect(deserialized.nodeTaintsPolicy, isNull);
    });

    test('serializes labelSelector correctly', () {
      final labelSelector = LabelSelector()
        ..matchLabels = {'app': LabelSelectorRequirement(key: 'web')}
        ..matchExpressions = [
          LabelSelectorRequirement(
              key: 'environment',
              operator: 'In',
              values: ['production', 'staging'])
        ];

      final constraint = TopologySpreadConstraint()
        ..labelSelector = labelSelector;

      final json = constraint.toJson();
      final deserialized = TopologySpreadConstraint.fromJson(json);

      expect(deserialized.toJson(), equals(constraint.toJson()));
    });

    test('excludes null fields from JSON', () {
      final constraint = TopologySpreadConstraint()
        ..maxSkew = 1
        ..topologyKey = 'kubernetes.io/zone';

      final json = constraint.toJson();

      expect(json.containsKey('maxSkew'), isTrue);
      expect(json.containsKey('topologyKey'), isTrue);
      expect(json.containsKey('labelSelector'), isFalse);
      expect(json.containsKey('matchLabelKeys'), isFalse);
      expect(json.containsKey('minDomains'), isFalse);
      expect(json.containsKey('nodeAffinityPolicy'), isFalse);
      expect(json.containsKey('nodeTaintsPolicy'), isFalse);
      expect(json.containsKey('whenUnsatisfiable'), isFalse);
    });
  });
}
