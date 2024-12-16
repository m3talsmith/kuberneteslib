import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/azure_file_volume_source.dart';

void main() {
  group('AzureFileVolumeSource', () {
    test('can be instantiated', () {
      final source = AzureFileVolumeSource()
        ..readOnly = false
        ..secretName = 'azure-secret'
        ..shareName = 'test-share';

      expect(source, isNotNull);
      expect(source.readOnly, isFalse);
      expect(source.secretName, equals('azure-secret'));
      expect(source.shareName, equals('test-share'));
    });

    test('fromMap creates instance correctly', () {
      final map = {
        'readOnly': true,
        'secretName': 'my-secret',
        'shareName': 'my-share',
      };

      final source = AzureFileVolumeSource.fromMap(map);

      expect(source.readOnly, isTrue);
      expect(source.secretName, equals('my-secret'));
      expect(source.shareName, equals('my-share'));
    });

    test('toJson produces correct map', () {
      final source = AzureFileVolumeSource()
        ..readOnly = true
        ..secretName = 'secret-1'
        ..shareName = 'share-1';

      final json = source.toJson();

      expect(json, {
        'readOnly': true,
        'secretName': 'secret-1',
        'shareName': 'share-1',
      });
    });

    test('fromJson creates instance correctly', () {
      final json = {
        'readOnly': false,
        'secretName': 'test-secret',
        'shareName': 'test-share',
      };

      final source = AzureFileVolumeSource.fromJson(json);

      expect(source.readOnly, isFalse);
      expect(source.secretName, equals('test-secret'));
      expect(source.shareName, equals('test-share'));
    });
  });
}
