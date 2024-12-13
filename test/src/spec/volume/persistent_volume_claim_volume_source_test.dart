import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/persistent_volume_claim_volume_source.dart';

void main() {
  group('PersistentVolumeClaimVolumeSource', () {
    test('can be instantiated', () {
      final pvcVolume = PersistentVolumeClaimVolumeSource()
        ..claimName = 'my-storage-claim'
        ..readOnly = false;

      expect(pvcVolume.claimName, equals('my-storage-claim'));
      expect(pvcVolume.readOnly, equals(false));
    });

    group('JSON serialization', () {
      test('toJson creates correct map', () {
        final pvcVolume = PersistentVolumeClaimVolumeSource()
          ..claimName = 'my-storage-claim'
          ..readOnly = true;

        final json = pvcVolume.toJson();
        
        expect(json, {
          'claimName': 'my-storage-claim',
          'readOnly': true,
        });
      });

      test('fromJson creates correct object', () {
        final json = {
          'claimName': 'my-storage-claim',
          'readOnly': true,
        };

        final pvcVolume = PersistentVolumeClaimVolumeSource.fromJson(json);
        
        expect(pvcVolume.claimName, equals('my-storage-claim'));
        expect(pvcVolume.readOnly, equals(true));
      });

      test('fromMap creates correct object', () {
        final map = {
          'claimName': 'my-storage-claim',
          'readOnly': true,
        };

        final pvcVolume = PersistentVolumeClaimVolumeSource.fromMap(map);
        
        expect(pvcVolume.claimName, equals('my-storage-claim'));
        expect(pvcVolume.readOnly, equals(true));
      });
    });
  });
} 