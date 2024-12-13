import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/vsphere_virtual_disk_volume_source.dart';

void main() {
  group('VsphereVirtualDiskVolumeSource', () {
    test('can be instantiated', () {
      final source = VsphereVirtualDiskVolumeSource();
      expect(source, isNotNull);
    });

    test('supports JSON serialization/deserialization', () {
      final source = VsphereVirtualDiskVolumeSource()
        ..volumePath = '[datastore1] dir/disk.vmdk'
        ..fsType = 'ext4'
        ..storagePolicyName = 'gold'
        ..storagePolicyID = 'policy-123';

      final json = source.toJson();
      expect(json, {
        'volumePath': '[datastore1] dir/disk.vmdk',
        'fsType': 'ext4',
        'storagePolicyName': 'gold',
        'storagePolicyID': 'policy-123',
      });

      final deserializedSource = VsphereVirtualDiskVolumeSource.fromJson(json);
      expect(deserializedSource.volumePath, '[datastore1] dir/disk.vmdk');
      expect(deserializedSource.fsType, 'ext4');
      expect(deserializedSource.storagePolicyName, 'gold');
      expect(deserializedSource.storagePolicyID, 'policy-123');
    });

    test('handles minimal required fields', () {
      final source = VsphereVirtualDiskVolumeSource()
        ..volumePath = '[datastore1] disk.vmdk'
        ..fsType = 'ext4';

      final json = source.toJson();
      expect(json, {
        'volumePath': '[datastore1] disk.vmdk',
        'fsType': 'ext4',
        'storagePolicyName': null,
        'storagePolicyID': null,
      });
    });
  });
} 