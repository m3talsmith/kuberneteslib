import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/local_object_reference.dart';

void main() {
  group('LocalObjectReference', () {
    test('can be instantiated', () {
      final reference = LocalObjectReference();
      expect(reference, isNotNull);
      expect(reference.name, isNull);
    });

    test('can be instantiated with a name', () {
      final reference = LocalObjectReference(name: 'test-secret');
      expect(reference.name, equals('test-secret'));
    });

    group('JSON serialization', () {
      test('toJson() excludes null values', () {
        final reference = LocalObjectReference();
        expect(reference.toJson(), isEmpty);
      });

      test('toJson() includes non-null values', () {
        final reference = LocalObjectReference(name: 'test-config');
        expect(reference.toJson(), equals({'name': 'test-config'}));
      });

      test('fromJson() creates instance with null values', () {
        final reference = LocalObjectReference.fromJson({});
        expect(reference.name, isNull);
      });

      test('fromJson() creates instance with provided values', () {
        final reference =
            LocalObjectReference.fromJson({'name': 'test-volume'});
        expect(reference.name, equals('test-volume'));
      });

      test('toJson() and fromJson() are symmetric', () {
        final original = LocalObjectReference(name: 'test-symmetry');
        final json = original.toJson();
        final decoded = LocalObjectReference.fromJson(json);
        expect(decoded.name, equals(original.name));
      });
    });
  });
}
