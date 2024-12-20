import 'package:kuberneteslib/src/spec/node_selector_requirement.dart';
import 'package:kuberneteslib/src/spec/node_selector_term.dart';
import 'package:kuberneteslib/src/spec/preferred_scheduling_term.dart';
import 'package:test/test.dart';

void main() {
  group('PreferredSchedulingTerm', () {
    test('can be instantiated', () {
      final term = PreferredSchedulingTerm();
      expect(term, isNotNull);
      expect(term.preference, isNull);
      expect(term.weight, isNull);
    });

    test('can be instantiated with values', () {
      final term = PreferredSchedulingTerm(
        preference: NodeSelectorTerm(),
        weight: 80,
      );
      expect(term.preference, isNotNull);
      expect(term.weight, equals(80));
    });

    test('can be created from JSON', () {
      final json = {
        'preference': {
          'matchExpressions': [
            {
              'key': 'node-type',
              'operator': 'In',
              'values': ['gpu']
            }
          ]
        },
        'weight': 80
      };

      final term = PreferredSchedulingTerm.fromJson(json);
      expect(term.preference, isNotNull);
      expect(term.preference?.matchExpressions?.length, equals(1));
      expect(term.weight, equals(80));
    });

    test('can be converted to JSON', () {
      final term = PreferredSchedulingTerm()
        ..preference = (NodeSelectorTerm()
          ..matchExpressions = [
            NodeSelectorRequirement()
              ..key = 'node-type'
              ..operator = 'In'
              ..values = ['gpu']
          ])
        ..weight = 80;

      final json = term.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['weight'], equals(80));
      expect(json['preference'], isNotNull);
      expect(json['preference']['matchExpressions'], isNotNull);
      expect(json['preference']['matchExpressions'][0]['key'],
          equals('node-type'));
      expect(
          json['preference']['matchExpressions'][0]['operator'], equals('In'));
      expect(
          json['preference']['matchExpressions'][0]['values'], equals(['gpu']));
    });

    test('handles null values in JSON conversion', () {
      final term = PreferredSchedulingTerm();
      final json = term.toJson();
      expect(json, isEmpty);
    });

    test('maintains value equality', () {
      final term1 = PreferredSchedulingTerm()
        ..preference = (NodeSelectorTerm()
          ..matchExpressions = [
            NodeSelectorRequirement()
              ..key = 'node-type'
              ..operator = 'In'
              ..values = ['gpu']
          ])
        ..weight = 80;

      final term2 = PreferredSchedulingTerm()
        ..preference = (NodeSelectorTerm()
          ..matchExpressions = [
            NodeSelectorRequirement()
              ..key = 'node-type'
              ..operator = 'In'
              ..values = ['gpu']
          ])
        ..weight = 80;

      expect(term1.toJson(), equals(term2.toJson()));
    });
  });
}
