import 'package:test/test.dart';
import 'package:kuberneteslib/src/cluster/context.dart';

void main() {
  group('Context', () {
    test('creates instance with all properties', () {
      final context = Context(
        name: 'test-context',
        cluster: 'test-cluster',
        user: 'test-user',
      );

      expect(context.name, equals('test-context'));
      expect(context.cluster, equals('test-cluster'));
      expect(context.user, equals('test-user'));
    });

    test('creates instance with null properties', () {
      final context = Context();

      expect(context.name, isNull);
      expect(context.cluster, isNull);
      expect(context.user, isNull);
    });

    group('JSON serialization', () {
      test('fromJson correctly parses nested context structure', () {
        final json = {
          'name': 'test-context',
          'context': {
            'cluster': 'test-cluster',
            'user': 'test-user',
          }
        };

        final context = Context.fromJson(json);

        expect(context.name, equals('test-context'));
        expect(context.cluster, equals('test-cluster'));
        expect(context.user, equals('test-user'));
      });

      test('toJson creates nested context structure', () {
        final context = Context(
          name: 'test-context',
          cluster: 'test-cluster',
          user: 'test-user',
        );

        final json = context.toJson();

        expect(
            json,
            equals({
              'name': 'test-context',
              'context': {
                'cluster': 'test-cluster',
                'user': 'test-user',
              }
            }));
      });

      test('toJson omits null values', () {
        final context = Context(name: 'test-context');

        final json = context.toJson();

        expect(
            json,
            equals({
              'name': 'test-context',
              'context': {},
            }));
      });

      test('fromJson handles missing optional fields', () {
        final json = {'name': 'test-context', 'context': {}};

        final context = Context.fromJson(json);

        expect(context.name, equals('test-context'));
        expect(context.cluster, isNull);
        expect(context.user, isNull);
      });
    });
  });
}
