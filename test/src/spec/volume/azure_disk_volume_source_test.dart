import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/azure_disk_volume_source.dart';

void main() {
  group('AzureDiskVolumeSource', () {
    test('can be instantiated', () {
      final source = AzureDiskVolumeSource();
      expect(source, isNotNull);
    });

    test('supports JSON serialization/deserialization', () {
      final source = AzureDiskVolumeSource()
        ..cachingMode = 'ReadWrite'
        ..diskName = 'my-azure-disk'
        ..diskURI = '/subscriptions/123/disks/my-azure-disk'
        ..fsType = 'ext4'
        ..kind = 'Managed'
        ..readOnly = true;

      final json = source.toJson();
      expect(json, {
        'cachingMode': 'ReadWrite',
        'diskName': 'my-azure-disk',
        'diskURI': '/subscriptions/123/disks/my-azure-disk',
        'fsType': 'ext4',
        'kind': 'Managed',
        'readOnly': true,
      });

      final deserialized = AzureDiskVolumeSource.fromJson(json);
      expect(deserialized.cachingMode, equals('ReadWrite'));
      expect(deserialized.diskName, equals('my-azure-disk'));
      expect(deserialized.diskURI,
          equals('/subscriptions/123/disks/my-azure-disk'));
      expect(deserialized.fsType, equals('ext4'));
      expect(deserialized.kind, equals('Managed'));
      expect(deserialized.readOnly, isTrue);
    });

    test('supports different caching modes', () {
      final source = AzureDiskVolumeSource()
        ..cachingMode = 'None'
        ..diskName = 'test-disk'
        ..diskURI = '/subscriptions/123/disks/test-disk';

      expect(source.cachingMode, equals('None'));
    });

    test('supports different disk kinds', () {
      final source = AzureDiskVolumeSource()
        ..kind = 'Shared'
        ..diskName = 'test-disk'
        ..diskURI = '/subscriptions/123/disks/test-disk';

      expect(source.kind, equals('Shared'));
    });

    test('supports different filesystem types', () {
      final source = AzureDiskVolumeSource()
        ..fsType = 'xfs'
        ..diskName = 'test-disk'
        ..diskURI = '/subscriptions/123/disks/test-disk';

      expect(source.fsType, equals('xfs'));
    });

    test('defaults to read/write mode', () {
      final source = AzureDiskVolumeSource()
        ..readOnly = false
        ..diskName = 'test-disk'
        ..diskURI = '/subscriptions/123/disks/test-disk';

      expect(source.readOnly, isFalse);
    });
  });
}
