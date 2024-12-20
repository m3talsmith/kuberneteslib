import 'package:test/test.dart';
import 'package:kuberneteslib/src/meta/owner_reference.dart';

void main() {
  group('OwnerReference', () {
    test('can be instantiated', () {
      final ownerRef = OwnerReference(
        apiVersion: 'apps/v1',
        kind: 'Deployment',
        name: 'nginx-deployment',
        uid: 'a123-456b-789c-0d',
        controller: true,
        blockOwnerDeletion: true,
      );

      expect(ownerRef.apiVersion, equals('apps/v1'));
      expect(ownerRef.kind, equals('Deployment'));
      expect(ownerRef.name, equals('nginx-deployment'));
      expect(ownerRef.uid, equals('a123-456b-789c-0d'));
      expect(ownerRef.controller, isTrue);
      expect(ownerRef.blockOwnerDeletion, isTrue);
    });

    test('can be instantiated with null values', () {
      final ownerRef = OwnerReference();

      expect(ownerRef.apiVersion, isNull);
      expect(ownerRef.kind, isNull);
      expect(ownerRef.name, isNull);
      expect(ownerRef.uid, isNull);
      expect(ownerRef.controller, isNull);
      expect(ownerRef.blockOwnerDeletion, isNull);
    });

    group('serialization', () {
      test('toJson() serializes all non-null fields', () {
        final ownerRef = OwnerReference(
          apiVersion: 'apps/v1',
          kind: 'Deployment',
          name: 'nginx-deployment',
          uid: 'a123-456b-789c-0d',
          controller: true,
          blockOwnerDeletion: true,
        );

        final json = ownerRef.toJson();

        expect(json, {
          'apiVersion': 'apps/v1',
          'kind': 'Deployment',
          'name': 'nginx-deployment',
          'uid': 'a123-456b-789c-0d',
          'controller': true,
          'blockOwnerDeletion': true,
        });
      });

      test('toJson() omits null fields', () {
        final ownerRef = OwnerReference(
          apiVersion: 'apps/v1',
          kind: 'Deployment',
          name: 'nginx-deployment',
          // uid, controller, and blockOwnerDeletion are null
        );

        final json = ownerRef.toJson();

        expect(json, {
          'apiVersion': 'apps/v1',
          'kind': 'Deployment',
          'name': 'nginx-deployment',
        });
        expect(json.containsKey('uid'), isFalse);
        expect(json.containsKey('controller'), isFalse);
        expect(json.containsKey('blockOwnerDeletion'), isFalse);
      });
    });

    group('deserialization', () {
      test('fromJson() deserializes all fields', () {
        final json = {
          'apiVersion': 'apps/v1',
          'kind': 'Deployment',
          'name': 'nginx-deployment',
          'uid': 'a123-456b-789c-0d',
          'controller': true,
          'blockOwnerDeletion': true,
        };

        final ownerRef = OwnerReference.fromJson(json);

        expect(ownerRef.apiVersion, equals('apps/v1'));
        expect(ownerRef.kind, equals('Deployment'));
        expect(ownerRef.name, equals('nginx-deployment'));
        expect(ownerRef.uid, equals('a123-456b-789c-0d'));
        expect(ownerRef.controller, isTrue);
        expect(ownerRef.blockOwnerDeletion, isTrue);
      });

      test('fromJson() handles missing optional fields', () {
        final json = {
          'apiVersion': 'apps/v1',
          'kind': 'Deployment',
          'name': 'nginx-deployment',
        };

        final ownerRef = OwnerReference.fromJson(json);

        expect(ownerRef.apiVersion, equals('apps/v1'));
        expect(ownerRef.kind, equals('Deployment'));
        expect(ownerRef.name, equals('nginx-deployment'));
        expect(ownerRef.uid, isNull);
        expect(ownerRef.controller, isNull);
        expect(ownerRef.blockOwnerDeletion, isNull);
      });
    });
  });
}
