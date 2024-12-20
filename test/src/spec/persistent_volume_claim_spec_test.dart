import 'package:kuberneteslib/src/spec/label_selector_requirement.dart';
import 'package:kuberneteslib/src/spec/persistent_volume_claim_spec.dart';
import 'package:kuberneteslib/src/spec/label_selector.dart';
import 'package:kuberneteslib/src/spec/resource_requirements.dart';
import 'package:kuberneteslib/src/spec/typed_local_object_reference.dart';
import 'package:test/test.dart';

void main() {
  group('PersistentVolumeClaimSpec', () {
    test('can be instantiated', () {
      final spec = PersistentVolumeClaimSpec();
      expect(spec, isNotNull);
      expect(spec.accessModes, isNull);
      expect(spec.dataSource, isNull);
      expect(spec.dataSourceRef, isNull);
      expect(spec.resources, isNull);
      expect(spec.selector, isNull);
    });

    test('serializes to JSON correctly', () {
      final spec = PersistentVolumeClaimSpec()
        ..accessModes = ['ReadWriteOnce']
        ..resources = (ResourceRequirements()..requests = {'storage': '10Gi'})
        ..storageClassName = 'standard'
        ..volumeMode = 'Filesystem'
        ..volumeName = 'my-volume';

      final json = spec.toJson();

      expect(json, {
        'accessModes': ['ReadWriteOnce'],
        'resources': {
          'requests': {'storage': '10Gi'}
        },
        'storageClassName': 'standard',
        'volumeMode': 'Filesystem',
        'volumeName': 'my-volume',
      });
    });

    test('deserializes from JSON correctly', () {
      final json = {
        'accessModes': ['ReadWriteOnce'],
        'resources': {
          'requests': {'storage': '10Gi'}
        },
        'storageClassName': 'standard',
        'volumeMode': 'Filesystem',
        'volumeName': 'my-volume',
      };

      final spec = PersistentVolumeClaimSpec.fromJson(json);

      expect(spec.accessModes, ['ReadWriteOnce']);
      expect(spec.resources?.requests, {'storage': '10Gi'});
      expect(spec.storageClassName, 'standard');
      expect(spec.volumeMode, 'Filesystem');
      expect(spec.volumeName, 'my-volume');
    });

    test('handles dataSource serialization', () {
      final spec = PersistentVolumeClaimSpec()
        ..dataSource = (TypedLocalObjectReference()
          ..apiGroup = 'snapshot.storage.k8s.io'
          ..kind = 'VolumeSnapshot'
          ..name = 'my-snapshot');

      final json = spec.toJson();
      expect(json['dataSource'], {
        'apiGroup': 'snapshot.storage.k8s.io',
        'kind': 'VolumeSnapshot',
        'name': 'my-snapshot',
      });

      final deserialized = PersistentVolumeClaimSpec.fromJson(json);
      expect(deserialized.dataSource?.apiGroup, 'snapshot.storage.k8s.io');
      expect(deserialized.dataSource?.kind, 'VolumeSnapshot');
      expect(deserialized.dataSource?.name, 'my-snapshot');
    });

    test('handles selector serialization', () {
      final spec = PersistentVolumeClaimSpec()
        ..selector = (LabelSelector()
          ..matchLabels = <String, LabelSelectorRequirement>{
            'environment': LabelSelectorRequirement(
              key: 'environment',
              operator: 'In',
              values: ['production'],
            )
          }
          ..matchExpressions = [
            (LabelSelectorRequirement()
              ..key = 'tier'
              ..operator = 'In'
              ..values = ['frontend'])
          ]);

      final json = spec.toJson();
      expect(json['selector'], {
        'matchLabels': {
          'environment': {
            'key': 'environment',
            'operator': 'In',
            'values': ['production']
          }
        },
        'matchExpressions': [
          {
            'key': 'tier',
            'operator': 'In',
            'values': ['frontend']
          }
        ],
      });

      final deserialized = PersistentVolumeClaimSpec.fromJson(json);
      expect(
          deserialized.selector?.matchLabels?.values.first.key, 'environment');
      expect(deserialized.selector?.matchLabels?.values.first.operator, 'In');
      expect(deserialized.selector?.matchLabels?.values.first.values,
          ['production']);
      expect(deserialized.selector?.matchExpressions?.first.key, 'tier');
      expect(deserialized.selector?.matchExpressions?.first.operator, 'In');
      expect(
          deserialized.selector?.matchExpressions?.first.values, ['frontend']);
    });

    test('excludes null values from JSON', () {
      final spec = PersistentVolumeClaimSpec();
      final json = spec.toJson();

      expect(json.containsKey('storageClassName'), isFalse);
      expect(json.containsKey('volumeMode'), isFalse);
      expect(json.containsKey('volumeName'), isFalse);
    });
  });
}
