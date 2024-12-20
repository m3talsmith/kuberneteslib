import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/label_selector.dart';
import 'package:kuberneteslib/src/spec/label_selector_requirement.dart';

void main() {
  group('LabelSelector', () {
    test('can be instantiated', () {
      final selector = LabelSelector();
      expect(selector, isNotNull);
      expect(selector.matchLabels, isNull);
      expect(selector.matchExpressions, isNull);
    });

    test('can be instantiated with matchLabels', () {
      final requirement = LabelSelectorRequirement()
        ..key = 'environment'
        ..operator = 'In'
        ..values = ['production'];

      final selector = LabelSelector()..matchLabels = {'app': requirement};

      expect(selector.matchLabels, isNotNull);
      expect(selector.matchLabels!['app'], equals(requirement));
    });

    test('can be instantiated with matchExpressions', () {
      final requirement = LabelSelectorRequirement()
        ..key = 'tier'
        ..operator = 'In'
        ..values = ['frontend', 'backend'];

      final selector = LabelSelector()..matchExpressions = [requirement];

      expect(selector.matchExpressions, isNotNull);
      expect(selector.matchExpressions!.length, equals(1));
      expect(selector.matchExpressions!.first, equals(requirement));
    });

    group('JSON serialization', () {
      test('toJson() with matchLabels', () {
        final requirement = LabelSelectorRequirement()
          ..key = 'environment'
          ..operator = 'In'
          ..values = ['production'];

        final selector = LabelSelector()..matchLabels = {'app': requirement};

        final json = selector.toJson();
        expect(json, isA<Map<String, dynamic>>());
        expect(json['matchLabels'], isNotNull);
        expect(json['matchLabels']['app'], equals(requirement.toJson()));
      });

      test('toJson() with matchExpressions', () {
        final requirement = LabelSelectorRequirement()
          ..key = 'tier'
          ..operator = 'In'
          ..values = ['frontend', 'backend'];

        final selector = LabelSelector()..matchExpressions = [requirement];

        final json = selector.toJson();
        expect(json, isA<Map<String, dynamic>>());
        expect(json['matchExpressions'], isA<List>());
        expect(json['matchExpressions'].first, equals(requirement.toJson()));
      });

      test('fromJson() with matchLabels', () {
        final json = {
          'matchLabels': {
            'app': {
              'key': 'environment',
              'operator': 'In',
              'values': ['production']
            }
          }
        };

        final selector = LabelSelector.fromJson(json);
        expect(selector.matchLabels, isNotNull);
        expect(selector.matchLabels!['app']!.key, equals('environment'));
        expect(selector.matchLabels!['app']!.operator, equals('In'));
        expect(selector.matchLabels!['app']!.values, equals(['production']));
      });

      test('fromJson() with matchExpressions', () {
        final json = {
          'matchExpressions': [
            {
              'key': 'tier',
              'operator': 'In',
              'values': ['frontend', 'backend']
            }
          ]
        };

        final selector = LabelSelector.fromJson(json);
        expect(selector.matchExpressions, isNotNull);
        expect(selector.matchExpressions!.length, equals(1));
        expect(selector.matchExpressions!.first.key, equals('tier'));
        expect(selector.matchExpressions!.first.operator, equals('In'));
        expect(selector.matchExpressions!.first.values,
            equals(['frontend', 'backend']));
      });

      test('empty json creates empty selector', () {
        final selector = LabelSelector.fromJson({});
        expect(selector.matchLabels, isNull);
        expect(selector.matchExpressions, isNull);
      });
    });
  });
}
