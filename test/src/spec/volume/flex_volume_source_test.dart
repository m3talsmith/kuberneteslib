import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/flex_volume_source.dart';
import 'package:kuberneteslib/src/spec/local_object_reference.dart';

void main() {
  group('FlexVolumeSource', () {
    late FlexVolumeSource flexVolume;

    setUp(() {
      flexVolume = FlexVolumeSource()
        ..driver = 'vendor/storage-driver'
        ..fsType = 'ext4'
        ..options = {
          'volumeID': 'vol123',
          'size': '100Gi'
        }
        ..readOnly = false
        ..secretRef = (LocalObjectReference()..name = 'storage-secret');
    });

    test('can be instantiated', () {
      expect(flexVolume, isNotNull);
      expect(flexVolume, isA<FlexVolumeSource>());
    });

    test('has correct property values', () {
      expect(flexVolume.driver, equals('vendor/storage-driver'));
      expect(flexVolume.fsType, equals('ext4'));
      expect(flexVolume.options, equals({
        'volumeID': 'vol123',
        'size': '100Gi'
      }));
      expect(flexVolume.readOnly, isFalse);
      expect(flexVolume.secretRef.name, equals('storage-secret'));
    });

    test('can be created from JSON', () {
      final json = {
        'driver': 'custom/driver',
        'fsType': 'xfs',
        'options': {
          'key': 'value'
        },
        'readOnly': true,
        'secretRef': {
          'name': 'test-secret'
        }
      };

      final fromJson = FlexVolumeSource.fromJson(json);

      expect(fromJson.driver, equals('custom/driver'));
      expect(fromJson.fsType, equals('xfs'));
      expect(fromJson.options, equals({'key': 'value'}));
      expect(fromJson.readOnly, isTrue);
      expect(fromJson.secretRef.name, equals('test-secret'));
    });
  });
} 