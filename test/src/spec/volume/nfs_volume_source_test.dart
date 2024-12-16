import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/nfs_volume_source.dart';

void main() {
  group('NFSVolumeSource', () {
    test('can be instantiated', () {
      final nfsVolume = NFSVolumeSource()
        ..server = 'nfs.example.com'
        ..path = '/exports/data'
        ..readOnly = false;

      expect(nfsVolume.server, equals('nfs.example.com'));
      expect(nfsVolume.path, equals('/exports/data'));
      expect(nfsVolume.readOnly, equals(false));
    });

    group('JSON serialization', () {
      test('toJson creates correct map', () {
        final nfsVolume = NFSVolumeSource()
          ..server = 'nfs.example.com'
          ..path = '/exports/data'
          ..readOnly = true;

        final json = nfsVolume.toJson();

        expect(json, {
          'server': 'nfs.example.com',
          'path': '/exports/data',
          'readOnly': true,
        });
      });

      test('fromJson creates correct object', () {
        final json = {
          'server': 'nfs.example.com',
          'path': '/exports/data',
          'readOnly': true,
        };

        final nfsVolume = NFSVolumeSource.fromJson(json);

        expect(nfsVolume.server, equals('nfs.example.com'));
        expect(nfsVolume.path, equals('/exports/data'));
        expect(nfsVolume.readOnly, equals(true));
      });
    });
  });
}
