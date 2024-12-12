import 'package:test/test.dart';
import 'package:kuberneteslib/src/resource/resource_template.dart';
import 'package:kuberneteslib/src/meta/object_meta.dart';
void main() {
  group('ResourceTemplate', () {
    test('creates with required parameters', () {
      final template = ResourceTemplate(
        kind: 'Pod',
        metadata: ObjectMeta()..name = 'test-pod',
      );

      expect(template.kind, equals('Pod'));
      expect(template.metadata?.name, equals('test-pod'));
      expect(template.apiVersion, equals('v1')); // default value
    });

    test('creates with custom apiVersion', () {
      final template = ResourceTemplate(
        kind: 'Deployment',
        metadata: ObjectMeta()..name = 'test-deployment',
        apiVersion: 'apps/v1',
      );

      expect(template.apiVersion, equals('apps/v1'));
    });

    test('serializes to JSON correctly', () {
      final template = ResourceTemplate(
        kind: 'Pod',
        metadata: ObjectMeta()
          ..name = 'test-pod'
          ..namespace = 'default',
        apiVersion: 'v1',
      );

      final json = template.toJson();

      expect(json['kind'], equals('Pod'));
      expect(json['apiVersion'], equals('v1'));
      expect(json['metadata']['name'], equals('test-pod'));
      expect(json['metadata']['namespace'], equals('default'));
    });

    test('deserializes from JSON correctly', () {
      final json = {
        'kind': 'Deployment',
        'apiVersion': 'apps/v1',
        'metadata': {
          'name': 'test-deployment',
          'namespace': 'default',
        },
        'spec': {
          'replicas': 3,
          'selector': {
            'matchLabels': {
              'app': 'test',
            },
          },
        },
      };

      final template = ResourceTemplate.fromJson(json);

      expect(template.kind, equals('Deployment'));
      expect(template.apiVersion, equals('apps/v1'));
      expect(template.metadata?.name, equals('test-deployment'));
      expect(template.metadata?.namespace, equals('default'));
      expect(template.spec, isNotNull);
    });

    test('handles null fields in JSON correctly', () {
      final json = {
        'kind': 'Pod',
        'metadata': {
          'name': 'test-pod',
        },
      };

      final template = ResourceTemplate.fromJson(json);

      expect(template.apiVersion, equals('v1')); // default value
      expect(template.spec, isNull);
      expect(template.status, isNull);
      expect(template.auth, isNull);
    });
  });
} 