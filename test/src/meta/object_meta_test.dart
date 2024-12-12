import 'package:test/test.dart';
import 'package:kuberneteslib/src/meta/object_meta.dart';

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
  });
} 