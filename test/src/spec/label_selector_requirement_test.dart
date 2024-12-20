import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/label_selector_requirement.dart';

void main() {
  group('LabelSelectorRequirement', () {
    test('can be instantiated', () {
      final requirement = LabelSelectorRequirement(
        key: 'environment',
        operator: 'In',
        values: ['production', 'staging'],
      );

      expect(requirement.key, equals('environment'));
      expect(requirement.operator, equals('In'));
      expect(requirement.values, equals(['production', 'staging']));
    });

    group('JSON serialization', () {
      test('toJson() creates correct JSON map', () {
        final requirement = LabelSelectorRequirement(
          key: 'app',
          operator: 'In',
          values: ['frontend'],
        );

        final json = requirement.toJson();

        expect(
            json,
            equals({
              'key': 'app',
              'operator': 'In',
              'values': ['frontend'],
            }));
      });

      test('fromJson() creates correct object', () {
        final json = {
          'key': 'tier',
          'operator': 'NotIn',
          'values': ['testing', 'development'],
        };

        final requirement = LabelSelectorRequirement.fromJson(json);

        expect(requirement.key, equals('tier'));
        expect(requirement.operator, equals('NotIn'));
        expect(requirement.values, equals(['testing', 'development']));
      });

      test('omits null values in JSON', () {
        final requirement = LabelSelectorRequirement(
          key: 'environment',
          operator: 'Exists',
        );

        final json = requirement.toJson();

        expect(
            json,
            equals({
              'key': 'environment',
              'operator': 'Exists',
            }));
        expect(json.containsKey('values'), isFalse);
      });
    });

    group('operator validation', () {
      test('supports In operator with values', () {
        final requirement = LabelSelectorRequirement(
          key: 'app',
          operator: 'In',
          values: ['web', 'api'],
        );

        expect(requirement.operator, equals('In'));
        expect(requirement.values, hasLength(2));
      });

      test('supports NotIn operator with values', () {
        final requirement = LabelSelectorRequirement(
          key: 'environment',
          operator: 'NotIn',
          values: ['test'],
        );

        expect(requirement.operator, equals('NotIn'));
        expect(requirement.values, hasLength(1));
      });

      test('supports Exists operator without values', () {
        final requirement = LabelSelectorRequirement(
          key: 'version',
          operator: 'Exists',
        );

        expect(requirement.operator, equals('Exists'));
        expect(requirement.values, isNull);
      });

      test('supports DoesNotExist operator without values', () {
        final requirement = LabelSelectorRequirement(
          key: 'deprecated',
          operator: 'DoesNotExist',
        );

        expect(requirement.operator, equals('DoesNotExist'));
        expect(requirement.values, isNull);
      });
    });
  });
}
