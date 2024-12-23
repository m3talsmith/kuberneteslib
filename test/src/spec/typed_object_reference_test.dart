import 'package:kuberneteslib/src/spec/typed_object_reference.dart';
import 'package:test/test.dart';

void main() {
  group('TypedObjectReference', () {
    test('can be instantiated', () {
      final reference = TypedObjectReference();
      expect(reference, isNotNull);
    });

    test('can be instantiated with all properties', () {
      final reference = TypedObjectReference(
        apiGroup: 'apps',
        kind: 'Deployment',
        name: 'web-server',
        namespace: 'production',
      );

      expect(reference.apiGroup, equals('apps'));
      expect(reference.kind, equals('Deployment'));
      expect(reference.name, equals('web-server'));
      expect(reference.namespace, equals('production'));
    });

    group('JSON serialization', () {
      test('toJson() includes non-null values', () {
        final reference = TypedObjectReference(
          apiGroup: 'apps',
          kind: 'Deployment',
          name: 'web-server',
          namespace: 'production',
        );

        final json = reference.toJson();

        expect(
            json,
            equals({
              'apiGroup': 'apps',
              'kind': 'Deployment',
              'name': 'web-server',
              'namespace': 'production',
            }));
      });

      test('toJson() excludes null values', () {
        final reference = TypedObjectReference(
          kind: 'Service',
          name: 'frontend',
        );

        final json = reference.toJson();

        expect(
            json,
            equals({
              'kind': 'Service',
              'name': 'frontend',
            }));
        expect(json.containsKey('apiGroup'), isFalse);
        expect(json.containsKey('namespace'), isFalse);
      });

      test('fromJson() creates correct instance', () {
        final json = {
          'apiGroup': 'apps',
          'kind': 'Deployment',
          'name': 'web-server',
          'namespace': 'production',
        };

        final reference = TypedObjectReference.fromJson(json);

        expect(reference.apiGroup, equals('apps'));
        expect(reference.kind, equals('Deployment'));
        expect(reference.name, equals('web-server'));
        expect(reference.namespace, equals('production'));
      });

      test('fromJson() handles missing optional values', () {
        final json = {
          'kind': 'Service',
          'name': 'frontend',
        };

        final reference = TypedObjectReference.fromJson(json);

        expect(reference.kind, equals('Service'));
        expect(reference.name, equals('frontend'));
        expect(reference.apiGroup, isNull);
        expect(reference.namespace, isNull);
      });
    });
  });
}
