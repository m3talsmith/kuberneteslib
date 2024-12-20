import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/persistent_volume_claim_template.dart';
import 'package:kuberneteslib/src/meta/object_meta.dart';
import 'package:kuberneteslib/src/spec/persistent_volume_claim_spec.dart';
import 'package:kuberneteslib/src/spec/resource_requirements.dart';

void main() {
  group('PersistentVolumeClaimTemplate', () {
    test('can be instantiated', () {
      final template = PersistentVolumeClaimTemplate();
      expect(template, isNotNull);
      expect(template.metadata, isNull);
      expect(template.spec, isNull);
    });

    test('can be instantiated with metadata and spec', () {
      final template = PersistentVolumeClaimTemplate(
        metadata: ObjectMeta(name: 'test-pvc'),
        spec: PersistentVolumeClaimSpec(
          accessModes: ['ReadWriteOnce'],
          resources: ResourceRequirements(
            requests: {'storage': '10Gi'},
          ),
        ),
      );

      expect(template.metadata?.name, equals('test-pvc'));
      expect(template.spec?.accessModes?.first, equals('ReadWriteOnce'));
      expect(template.spec?.resources?.requests?['storage'], equals('10Gi'));
    });

    test('can be converted to JSON', () {
      final template = PersistentVolumeClaimTemplate(
        metadata: ObjectMeta(
          name: 'data',
          labels: {'app': 'database'},
        ),
        spec: PersistentVolumeClaimSpec(
          accessModes: ['ReadWriteOnce'],
          resources: ResourceRequirements(
            requests: {'storage': '10Gi'},
          ),
          storageClassName: 'standard',
        ),
      );

      final json = template.toJson();

      expect(json, {
        'metadata': {
          'name': 'data',
          'labels': {'app': 'database'},
        },
        'spec': {
          'accessModes': ['ReadWriteOnce'],
          'resources': {
            'requests': {'storage': '10Gi'},
          },
          'storageClassName': 'standard',
        },
      });
    });

    test('can be created from JSON', () {
      final json = {
        'metadata': {
          'name': 'data',
          'labels': {'app': 'database'},
        },
        'spec': {
          'accessModes': ['ReadWriteOnce'],
          'resources': {
            'requests': {'storage': '10Gi'},
          },
          'storageClassName': 'standard',
        },
      };

      final template = PersistentVolumeClaimTemplate.fromJson(json);

      expect(template.metadata?.name, equals('data'));
      expect(template.metadata?.labels?['app'], equals('database'));
      expect(template.spec?.accessModes?.first, equals('ReadWriteOnce'));
      expect(template.spec?.resources?.requests?['storage'], equals('10Gi'));
      expect(template.spec?.storageClassName, equals('standard'));
    });

    test('handles null values correctly', () {
      final template = PersistentVolumeClaimTemplate();
      final json = template.toJson();
      expect(json, isEmpty);

      final fromJson = PersistentVolumeClaimTemplate.fromJson(json);
      expect(fromJson.metadata, isNull);
      expect(fromJson.spec, isNull);
    });
  });
}
