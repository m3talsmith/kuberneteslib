import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/fc_volume_source.dart';

void main() {
  group('FCVolumeSource', () {
    test('can be instantiated', () {
      expect(FCVolumeSource(), isNotNull);
    });

    test('supports JSON serialization', () {
      final source = FCVolumeSource()
        ..fsType = 'ext4'
        ..lun = 0
        ..readOnly = false
        ..targetWWNs = ['50060e801049cfd1']
        ..wwids = ['3600a098038303634'];

      final json = source.toJson();
      final restored = FCVolumeSource.fromJson(json);

      expect(restored.fsType, equals('ext4'));
      expect(restored.lun, equals(0));
      expect(restored.readOnly, equals(false));
      expect(restored.targetWWNs, equals(['50060e801049cfd1']));
      expect(restored.wwids, equals(['3600a098038303634']));
    });

    test('handles empty WWIDs and targetWWNs lists', () {
      final source = FCVolumeSource()
        ..fsType = 'xfs'
        ..lun = 1
        ..readOnly = true
        ..targetWWNs = []
        ..wwids = [];

      final json = source.toJson();
      final restored = FCVolumeSource.fromJson(json);

      expect(restored.targetWWNs, isEmpty);
      expect(restored.wwids, isEmpty);
    });

    test('handles multiple WWNs and WWIDs', () {
      final source = FCVolumeSource()
        ..fsType = 'ext4'
        ..lun = 2
        ..readOnly = false
        ..targetWWNs = ['wwn1', 'wwn2', 'wwn3']
        ..wwids = ['wwid1', 'wwid2'];

      final json = source.toJson();
      final restored = FCVolumeSource.fromJson(json);

      expect(restored.targetWWNs, hasLength(3));
      expect(restored.wwids, hasLength(2));
    });
  });
}
