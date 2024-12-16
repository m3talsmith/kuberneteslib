import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/gce_persistent_disk_volume_source.dart';

void main() {
  group('GCEPersistentDiskVolumeSource', () {
    test('can be instantiated', () {
      final source = GCEPersistentDiskVolumeSource();
      expect(source, isNotNull);
    });

    test('supports value assignment', () {
      final source = GCEPersistentDiskVolumeSource()
        ..fsType = 'ext4'
        ..partition = 1
        ..pdName = 'test-disk'
        ..readOnly = true;

      expect(source.fsType, equals('ext4'));
      expect(source.partition, equals(1));
      expect(source.pdName, equals('test-disk'));
      expect(source.readOnly, isTrue);
    });

    test('can be serialized to JSON', () {
      final source = GCEPersistentDiskVolumeSource()
        ..fsType = 'ext4'
        ..partition = 1
        ..pdName = 'test-disk'
        ..readOnly = true;

      final json = source.toJson();

      expect(json, {
        'fsType': 'ext4',
        'partition': 1,
        'pdName': 'test-disk',
        'readOnly': true,
      });
    });

    test('can be deserialized from JSON', () {
      final json = {
        'fsType': 'ext4',
        'partition': 1,
        'pdName': 'test-disk',
        'readOnly': true,
      };

      final source = GCEPersistentDiskVolumeSource.fromJson(json);

      expect(source.fsType, equals('ext4'));
      expect(source.partition, equals(1));
      expect(source.pdName, equals('test-disk'));
      expect(source.readOnly, isTrue);
    });

    test('supports empty/null values', () {
      final source = GCEPersistentDiskVolumeSource();

      expect(source.fsType, isNull);
      expect(source.partition, isNull);
      expect(source.pdName, isNull);
      expect(source.readOnly, isNull);
    });
  });
}
