import 'package:kuberneteslib/src/spec/typed_local_object_reference.dart';
import 'package:test/test.dart';

void main() {
  group('TypedLocalObjectReference', () {
    test('can be instantiated', () {
      final reference = TypedLocalObjectReference();
      expect(reference, isNotNull);
    });

    test('can be instantiated with parameters', () {
      final reference = TypedLocalObjectReference(
        apiGroup: 'apps',
        kind: 'Deployment',
        name: 'web-server',
      );

      expect(reference.apiGroup, equals('apps'));
      expect(reference.kind, equals('Deployment'));
      expect(reference.name, equals('web-server'));
    });

    group('JSON serialization', () {
      test('toJson() includes non-null values', () {
        final reference = TypedLocalObjectReference(
          apiGroup: 'apps',
          kind: 'Deployment',
          name: 'web-server',
        );

        final json = reference.toJson();

        expect(
            json,
            equals({
              'apiGroup': 'apps',
              'kind': 'Deployment',
              'name': 'web-server',
            }));
      });

      test('toJson() excludes null values', () {
        final reference = TypedLocalObjectReference(
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
      });

      test('fromJson() creates correct instance', () {
        final json = {
          'apiGroup': 'networking.k8s.io',
          'kind': 'Ingress',
          'name': 'main-ingress',
        };

        final reference = TypedLocalObjectReference.fromJson(json);

        expect(reference.apiGroup, equals('networking.k8s.io'));
        expect(reference.kind, equals('Ingress'));
        expect(reference.name, equals('main-ingress'));
      });

      test('fromJson() handles missing optional fields', () {
        final json = {
          'kind': 'Service',
          'name': 'backend',
        };

        final reference = TypedLocalObjectReference.fromJson(json);

        expect(reference.apiGroup, isNull);
        expect(reference.kind, equals('Service'));
        expect(reference.name, equals('backend'));
      });
    });
  });
}
