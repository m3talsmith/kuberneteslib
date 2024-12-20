import 'package:test/test.dart';
import 'package:kuberneteslib/src/meta/object_meta.dart';
import 'package:kuberneteslib/src/meta/owner_reference.dart';
import 'package:kuberneteslib/src/meta/managed_field_entry.dart';

void main() {
  group('ObjectMeta', () {
    test('serializes to JSON with minimal properties', () {
      final meta = ObjectMeta()..name = 'test-object';

      final json = meta.toJson();

      expect(json, {
        'name': 'test-object',
      });
    });

    test('deserializes from JSON with minimal properties', () {
      final json = {
        'name': 'test-object',
      };

      final meta = ObjectMeta.fromJson(json);

      expect(meta.name, equals('test-object'));
    });

    test('handles all properties correctly', () {
      final meta = ObjectMeta()
        ..name = 'test-pod'
        ..namespace = 'default'
        ..labels = {'app': 'web', 'env': 'prod'}
        ..annotations = {'kubernetes.io/created-by': 'test'}
        ..generateName = 'test-'
        ..finalizers = ['kubernetes.io/pv-protection']
        ..generation = 1
        ..resourceVersion = '123456'
        ..uid = 'abc-123'
        ..creationTimestamp = DateTime(2024, 1, 1)
        ..deletionTimestamp = DateTime(2024, 1, 2)
        ..deletionGracePeriodSeconds = 30
        ..ownerReferences = []
        ..managedFields = []
        ..selfLink = '/api/v1/namespaces/default/pods/test-pod';

      // Verify all properties are set
      expect(meta.name, equals('test-pod'));
      expect(meta.namespace, equals('default'));
      expect(meta.labels, equals({'app': 'web', 'env': 'prod'}));
      expect(meta.annotations, equals({'kubernetes.io/created-by': 'test'}));
      expect(meta.generateName, equals('test-'));
      expect(meta.finalizers, equals(['kubernetes.io/pv-protection']));
      expect(meta.generation, equals(1));
      expect(meta.resourceVersion, equals('123456'));
      expect(meta.uid, equals('abc-123'));
      expect(meta.creationTimestamp, equals(DateTime(2024, 1, 1)));
      expect(meta.deletionTimestamp, equals(DateTime(2024, 1, 2)));
      expect(meta.deletionGracePeriodSeconds, equals(30));
      expect(meta.ownerReferences, isEmpty);
      expect(meta.managedFields, isEmpty);
      expect(meta.selfLink, equals('/api/v1/namespaces/default/pods/test-pod'));
    });

    test('JSON serialization excludes null values', () {
      final meta = ObjectMeta()
        ..name = 'test-object'
        ..labels = {'app': 'web'};

      final json = meta.toJson();

      expect(json.containsKey('namespace'), isFalse);
      expect(json.containsKey('annotations'), isFalse);
      expect(json.containsKey('deletionTimestamp'), isFalse);
    });

    test('can be instantiated with basic properties', () {
      final meta = ObjectMeta(
        name: 'test-object',
        namespace: 'default',
        labels: {'app': 'test'},
        annotations: {'description': 'test object'},
      );

      expect(meta.name, equals('test-object'));
      expect(meta.namespace, equals('default'));
      expect(meta.labels?['app'], equals('test'));
      expect(meta.annotations?['description'], equals('test object'));
    });

    test('handles DateTime serialization correctly', () {
      final timestamp = DateTime.utc(2024, 1, 1, 12, 0);
      final meta = ObjectMeta()
        ..creationTimestamp = timestamp
        ..deletionTimestamp = timestamp;

      final json = meta.toJson();
      expect(json['creationTimestamp'], equals('2024-01-01T12:00:00.000Z'));
      expect(json['deletionTimestamp'], equals('2024-01-01T12:00:00.000Z'));

      final decoded = ObjectMeta.fromJson(json);
      expect(decoded.creationTimestamp, equals(timestamp));
      expect(decoded.deletionTimestamp, equals(timestamp));
    });

    test('handles ownerReferences serialization', () {
      final owner = OwnerReference(
        apiVersion: 'apps/v1',
        kind: 'Deployment',
        name: 'test-deployment',
        uid: '123-456',
      );

      final meta = ObjectMeta()..ownerReferences = [owner];
      final json = meta.toJson();

      expect(json['ownerReferences'], isList);
      expect(json['ownerReferences']?.first['name'], equals('test-deployment'));

      final decoded = ObjectMeta.fromJson(json);
      expect(decoded.ownerReferences?.first.name, equals('test-deployment'));
      expect(decoded.ownerReferences?.first.kind, equals('Deployment'));
    });

    test('handles managedFields serialization', () {
      final field = ManagedFieldEntry(
        manager: 'test-manager',
        operation: 'Update',
        apiVersion: 'v1',
      );

      final meta = ObjectMeta()..managedFields = [field];
      final json = meta.toJson();

      expect(json['managedFields'], isList);
      expect(json['managedFields']?.first['manager'], equals('test-manager'));

      final decoded = ObjectMeta.fromJson(json);
      expect(decoded.managedFields?.first.manager, equals('test-manager'));
      expect(decoded.managedFields?.first.operation, equals('Update'));
    });

    test('excludes null values from JSON', () {
      final meta = ObjectMeta(name: 'test');
      final json = meta.toJson();

      expect(json.containsKey('namespace'), isFalse);
      expect(json.containsKey('labels'), isFalse);
      expect(json.containsKey('annotations'), isFalse);
      expect(json.containsKey('ownerReferences'), isFalse);
      expect(json.containsKey('managedFields'), isFalse);
    });
  });
}
