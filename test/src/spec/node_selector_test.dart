import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/node_selector.dart';
import 'package:kuberneteslib/src/spec/node_selector_term.dart';
import 'package:kuberneteslib/src/spec/node_selector_requirement.dart';

void main() {
  group('NodeSelector', () {
    test('can be instantiated', () {
      final selector = NodeSelector();
      expect(selector, isNotNull);
      expect(selector.nodeSelectorTerms, isNull);
    });

    test('can be instantiated with terms', () {
      final selector = NodeSelector(
        nodeSelectorTerms: [
          NodeSelectorTerm(
            matchExpressions: [
              NodeSelectorRequirement(
                key: 'kubernetes.io/os',
                operator: 'In',
                values: ['linux'],
              ),
            ],
          ),
        ],
      );

      expect(selector.nodeSelectorTerms, isNotNull);
      expect(selector.nodeSelectorTerms!.length, equals(1));
      expect(
          selector.nodeSelectorTerms![0].matchExpressions!.length, equals(1));
      expect(selector.nodeSelectorTerms![0].matchExpressions![0].key,
          equals('kubernetes.io/os'));
    });

    group('JSON serialization', () {
      test('can be serialized to JSON', () {
        final selector = NodeSelector(
          nodeSelectorTerms: [
            NodeSelectorTerm(
              matchExpressions: [
                NodeSelectorRequirement(
                  key: 'kubernetes.io/os',
                  operator: 'In',
                  values: ['linux'],
                ),
              ],
              matchFields: [
                NodeSelectorRequirement(
                  key: 'metadata.name',
                  operator: 'NotIn',
                  values: ['maintenance-node'],
                ),
              ],
            ),
          ],
        );

        final json = selector.toJson();
        expect(json, isA<Map<String, dynamic>>());
        expect(json['nodeSelectorTerms'], isA<List>());
        expect(json['nodeSelectorTerms'].length, equals(1));

        final term = json['nodeSelectorTerms'][0];
        expect(term['matchExpressions'], isA<List>());
        expect(term['matchFields'], isA<List>());
      });

      test('can be deserialized from JSON', () {
        final json = {
          'nodeSelectorTerms': [
            {
              'matchExpressions': [
                {
                  'key': 'kubernetes.io/os',
                  'operator': 'In',
                  'values': ['linux']
                }
              ],
              'matchFields': [
                {
                  'key': 'metadata.name',
                  'operator': 'NotIn',
                  'values': ['maintenance-node']
                }
              ]
            }
          ]
        };

        final selector = NodeSelector.fromJson(json);
        expect(selector.nodeSelectorTerms, isNotNull);
        expect(selector.nodeSelectorTerms!.length, equals(1));

        final term = selector.nodeSelectorTerms![0];
        expect(term.matchExpressions!.length, equals(1));
        expect(term.matchFields!.length, equals(1));

        final expression = term.matchExpressions![0];
        expect(expression.key, equals('kubernetes.io/os'));
        expect(expression.operator, equals('In'));
        expect(expression.values, equals(['linux']));

        final field = term.matchFields![0];
        expect(field.key, equals('metadata.name'));
        expect(field.operator, equals('NotIn'));
        expect(field.values, equals(['maintenance-node']));
      });

      test('handles null values correctly', () {
        final selector = NodeSelector();
        final json = selector.toJson();
        expect(json, equals({}));

        final deserializedSelector = NodeSelector.fromJson(json);
        expect(deserializedSelector.nodeSelectorTerms, isNull);
      });
    });
  });
}
