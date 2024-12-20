import 'package:kuberneteslib/src/spec/node_selector_term.dart';
import 'package:kuberneteslib/src/spec/node_selector_requirement.dart';
import 'package:test/test.dart';

void main() {
  group('NodeSelectorTerm', () {
    test('can be instantiated', () {
      final term = NodeSelectorTerm();
      expect(term, isNotNull);
      expect(term.matchExpressions, isNull);
      expect(term.matchFields, isNull);
    });

    test('can be instantiated with parameters', () {
      final term = NodeSelectorTerm(
        matchExpressions: [
          NodeSelectorRequirement()
            ..key = 'kubernetes.io/os'
            ..operator = 'In'
            ..values = ['linux'],
        ],
        matchFields: [
          NodeSelectorRequirement()
            ..key = 'metadata.name'
            ..operator = 'NotIn'
            ..values = ['node-maintenance'],
        ],
      );

      expect(term.matchExpressions, hasLength(1));
      expect(term.matchFields, hasLength(1));
    });

    group('json', () {
      test('toJson creates correct JSON', () {
        final term = NodeSelectorTerm()
          ..matchExpressions = [
            NodeSelectorRequirement()
              ..key = 'kubernetes.io/os'
              ..operator = 'In'
              ..values = ['linux'],
            NodeSelectorRequirement()
              ..key = 'node.kubernetes.io/instance-type'
              ..operator = 'In'
              ..values = ['c5.xlarge', 'c5.2xlarge']
          ]
          ..matchFields = [
            NodeSelectorRequirement()
              ..key = 'metadata.name'
              ..operator = 'NotIn'
              ..values = ['node-maintenance']
          ];

        final json = term.toJson();

        expect(json, {
          'matchExpressions': [
            {
              'key': 'kubernetes.io/os',
              'operator': 'In',
              'values': ['linux']
            },
            {
              'key': 'node.kubernetes.io/instance-type',
              'operator': 'In',
              'values': ['c5.xlarge', 'c5.2xlarge']
            }
          ],
          'matchFields': [
            {
              'key': 'metadata.name',
              'operator': 'NotIn',
              'values': ['node-maintenance']
            }
          ]
        });
      });

      test('fromJson creates correct object', () {
        final json = {
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
              'values': ['node-maintenance']
            }
          ]
        };

        final term = NodeSelectorTerm.fromJson(json);

        expect(term.matchExpressions, hasLength(1));
        expect(term.matchExpressions![0].key, equals('kubernetes.io/os'));
        expect(term.matchExpressions![0].operator, equals('In'));
        expect(term.matchExpressions![0].values, equals(['linux']));

        expect(term.matchFields, hasLength(1));
        expect(term.matchFields![0].key, equals('metadata.name'));
        expect(term.matchFields![0].operator, equals('NotIn'));
        expect(term.matchFields![0].values, equals(['node-maintenance']));
      });

      test('null fields are not included in JSON', () {
        final term = NodeSelectorTerm();
        final json = term.toJson();

        expect(json, isEmpty);
      });

      test('handles empty lists', () {
        final term = NodeSelectorTerm()
          ..matchExpressions = []
          ..matchFields = [];

        final json = term.toJson();

        expect(json, {'matchExpressions': [], 'matchFields': []});
      });
    });
  });
}
