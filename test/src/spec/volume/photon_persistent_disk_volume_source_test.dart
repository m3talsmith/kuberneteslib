import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/photon_persistent_disk_volume_source.dart';

void main() {
  group('PhotonPersistentDiskVolumeSource', () {
    test('can be instantiated', () {
      final photonDisk = PhotonPersistentDiskVolumeSource()
        ..pdID = 'disk-123456'
        ..fsType = 'ext4';

      expect(photonDisk.pdID, equals('disk-123456'));
      expect(photonDisk.fsType, equals('ext4'));
    });

    group('JSON serialization', () {
      test('toJson creates correct map', () {
        final photonDisk = PhotonPersistentDiskVolumeSource()
          ..pdID = 'disk-123456'
          ..fsType = 'ext4';

        final json = photonDisk.toJson();
        
        expect(json, {
          'pdID': 'disk-123456',
          'fsType': 'ext4',
        });
      });

      test('fromJson creates correct object', () {
        final json = {
          'pdID': 'disk-123456',
          'fsType': 'ext4',
        };

        final photonDisk = PhotonPersistentDiskVolumeSource.fromJson(json);
        
        expect(photonDisk.pdID, equals('disk-123456'));
        expect(photonDisk.fsType, equals('ext4'));
      });
    });
  });
} 