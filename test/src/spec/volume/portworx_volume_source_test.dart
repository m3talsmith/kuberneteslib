import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/portworx_volume_source.dart';

void main() {
  group('PortworxVolumeSource', () {
    test('can be instantiated', () {
      final portworxVolume = PortworxVolumeSource()
        ..volumeID = 'pxd-123'
        ..fsType = 'ext4'
        ..readOnly = true;

      expect(portworxVolume.volumeID, equals('pxd-123'));
      expect(portworxVolume.fsType, equals('ext4'));
      expect(portworxVolume.readOnly, isTrue);
    });

    group('JSON serialization', () {
      test('toJson creates correct map', () {
        final portworxVolume = PortworxVolumeSource()
          ..volumeID = 'pxd-123'
          ..fsType = 'xfs'
          ..readOnly = false;

        final json = portworxVolume.toJson();

        expect(json, {
          'volumeID': 'pxd-123',
          'fsType': 'xfs',
          'readOnly': false,
        });
      });

      test('fromJson creates correct object', () {
        final json = {
          'volumeID': 'pxd-123',
          'fsType': 'ext4',
          'readOnly': true,
        };

        final portworxVolume = PortworxVolumeSource.fromJson(json);

        expect(portworxVolume.volumeID, equals('pxd-123'));
        expect(portworxVolume.fsType, equals('ext4'));
        expect(portworxVolume.readOnly, isTrue);
      });
    });
  });
}
