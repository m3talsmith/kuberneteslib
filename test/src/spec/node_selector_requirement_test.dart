import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/node_selector_requirement.dart';

void main() {
  group('NodeSelectorRequirement', () {
    test('can be instantiated', () {
      final requirement = NodeSelectorRequirement();
      expect(requirement, isNotNull);
    });

    test('can be instantiated with parameters', () {
      final requirement = NodeSelectorRequirement(
        key: 'kubernetes.io/os',
        operator: 'In',
        values: ['linux'],
      );

      expect(requirement.key, equals('kubernetes.io/os'));
      expect(requirement.operator, equals('In'));
      expect(requirement.values, equals(['linux']));
    });

    group('serialization', () {
      test('toJson() creates correct JSON with all fields', () {
        final requirement = NodeSelectorRequirement(
          key: 'kubernetes.io/os',
          operator: 'In',
          values: ['linux', 'windows'],
        );

        final json = requirement.toJson();

        expect(
            json,
            equals({
              'key': 'kubernetes.io/os',
              'operator': 'In',
              'values': ['linux', 'windows'],
            }));
      });

      test('toJson() omits null fields', () {
        final requirement = NodeSelectorRequirement(
          key: 'kubernetes.io/os',
          operator: 'Exists',
        );

        final json = requirement.toJson();

        expect(
            json,
            equals({
              'key': 'kubernetes.io/os',
              'operator': 'Exists',
            }));
        expect(json.containsKey('values'), isFalse);
      });

      test('fromJson() creates correct instance', () {
        final json = {
          'key': 'kubernetes.io/os',
          'operator': 'In',
          'values': ['linux', 'windows'],
        };

        final requirement = NodeSelectorRequirement.fromJson(json);

        expect(requirement.key, equals('kubernetes.io/os'));
        expect(requirement.operator, equals('In'));
        expect(requirement.values, equals(['linux', 'windows']));
      });
    });

    group('operator scenarios', () {
      test('In operator with multiple values', () {
        final requirement = NodeSelectorRequirement(
          key: 'node.kubernetes.io/instance-type',
          operator: 'In',
          values: ['t2.micro', 't2.small'],
        );

        expect(
            requirement.toJson(),
            equals({
              'key': 'node.kubernetes.io/instance-type',
              'operator': 'In',
              'values': ['t2.micro', 't2.small'],
            }));
      });

      test('Exists operator with no values', () {
        final requirement = NodeSelectorRequirement(
          key: 'kubernetes.io/feature',
          operator: 'Exists',
        );

        expect(
            requirement.toJson(),
            equals({
              'key': 'kubernetes.io/feature',
              'operator': 'Exists',
            }));
      });

      test('Gt operator with single value', () {
        final requirement = NodeSelectorRequirement(
          key: 'resource.memory',
          operator: 'Gt',
          values: ['4Gi'],
        );

        expect(
            requirement.toJson(),
            equals({
              'key': 'resource.memory',
              'operator': 'Gt',
              'values': ['4Gi'],
            }));
      });
    });
  });
}
