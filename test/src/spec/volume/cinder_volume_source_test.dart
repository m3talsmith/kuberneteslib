import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/cinder_volume_source.dart';
import 'package:kuberneteslib/src/spec/local_object_reference.dart';

void main() {
  group('CinderVolumeSource', () {
    test('can be instantiated', () {
      expect(CinderVolumeSource(), isNotNull);
    });

    test('json serialization works', () {
      final source = CinderVolumeSource()
        ..fsType = 'ext4'
        ..readOnly = true
        ..secretRef = (LocalObjectReference()..name = 'cinder-secret')
        ..volumeID = 'vol-123456';

      final json = source.toJson();
      expect(json, {
        'fsType': 'ext4',
        'readOnly': true,
        'secretRef': {'name': 'cinder-secret'},
        'volumeID': 'vol-123456',
      });

      final deserialized = CinderVolumeSource.fromJson(json);
      expect(deserialized.fsType, 'ext4');
      expect(deserialized.readOnly, true);
      expect(deserialized.secretRef?.name, 'cinder-secret');
      expect(deserialized.volumeID, 'vol-123456');
    });

    test('supports various filesystem types', () {
      final source = CinderVolumeSource()..fsType = 'xfs';
      expect(source.fsType, 'xfs');

      source.fsType = 'ntfs';
      expect(source.fsType, 'ntfs');
    });

    test('can be instantiated with null values', () {
      final source = CinderVolumeSource();
      expect(source.fsType, isNull);
      expect(source.readOnly, isNull);
      expect(source.secretRef, isNull);
      expect(source.volumeID, isNull);
    });

    test('json serialization excludes null values', () {
      final source = CinderVolumeSource()
        ..volumeID = 'vol-123456';

      final json = source.toJson();
      expect(json, {
        'volumeID': 'vol-123456',
      });
      expect(json.containsKey('fsType'), isFalse);
      expect(json.containsKey('readOnly'), isFalse);
      expect(json.containsKey('secretRef'), isFalse);
    });
  });
} 