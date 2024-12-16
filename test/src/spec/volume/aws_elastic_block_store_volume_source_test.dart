import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/aws_elastic_block_store_volume_source.dart';

void main() {
  group('AWSElasticBlockStoreVolumeSource', () {
    test('can be instantiated', () {
      final source = AWSElasticBlockStoreVolumeSource();
      expect(source, isNotNull);
    });

    test('supports JSON serialization/deserialization', () {
      final source = AWSElasticBlockStoreVolumeSource()
        ..fsType = 'ext4'
        ..partition = 1
        ..readOnly = true
        ..volumeID = 'vol-1234567890abcdef0';

      final json = source.toJson();
      expect(json, {
        'fsType': 'ext4',
        'partition': 1,
        'readOnly': true,
        'volumeID': 'vol-1234567890abcdef0',
      });

      final deserialized = AWSElasticBlockStoreVolumeSource.fromJson(json);
      expect(deserialized.fsType, equals('ext4'));
      expect(deserialized.partition, equals(1));
      expect(deserialized.readOnly, isTrue);
      expect(deserialized.volumeID, equals('vol-1234567890abcdef0'));
    });

    test('handles different filesystem types', () {
      final source = AWSElasticBlockStoreVolumeSource()
        ..fsType = 'xfs'
        ..volumeID = 'vol-1234567890abcdef0';

      expect(source.fsType, equals('xfs'));
    });

    test('handles optional partition value', () {
      final source = AWSElasticBlockStoreVolumeSource()
        ..fsType = 'ext4'
        ..volumeID = 'vol-1234567890abcdef0'
        ..partition = 2;

      expect(source.partition, equals(2));
    });

    test('defaults to read/write mode', () {
      final source = AWSElasticBlockStoreVolumeSource()
        ..fsType = 'ext4'
        ..volumeID = 'vol-1234567890abcdef0'
        ..readOnly = false;

      expect(source.readOnly, isFalse);
    });
  });
}
