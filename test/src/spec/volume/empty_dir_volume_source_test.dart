import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/empty_dir_volume_source.dart';

void main() {
  group('EmptyDirVolumeSource', () {
    test('creates instance with default values', () {
      final emptyDir = EmptyDirVolumeSource();

      expect(emptyDir.medium, isNull);
      expect(emptyDir.sizeLimit, isNull);
    });

    test('serializes to JSON correctly', () {
      final emptyDir = EmptyDirVolumeSource()
        ..medium = 'Memory'
        ..sizeLimit = '1Gi';

      final json = emptyDir.toJson();

      expect(json, {
        'medium': 'Memory',
        'sizeLimit': '1Gi',
      });
    });

    test('deserializes from JSON correctly', () {
      final json = {
        'medium': 'Memory',
        'sizeLimit': '1Gi',
      };

      final emptyDir = EmptyDirVolumeSource.fromJson(json);

      expect(emptyDir.medium, equals('Memory'));
      expect(emptyDir.sizeLimit?.toString(), equals('1Gi'));
    });

    test('handles empty JSON correctly', () {
      final emptyDir = EmptyDirVolumeSource.fromJson({});

      expect(emptyDir.medium, isNull);
      expect(emptyDir.sizeLimit, isNull);
    });

    test('handles null values in JSON correctly', () {
      final json = {
        'medium': null,
        'sizeLimit': null,
      };

      final emptyDir = EmptyDirVolumeSource.fromJson(json);

      expect(emptyDir.medium, isNull);
      expect(emptyDir.sizeLimit, isNull);
    });
  });
}
