import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/rbd_volume_source.dart';
import 'package:kuberneteslib/src/spec/local_object_reference.dart';

void main() {
  group('RBDVolumeSource', () {
    test('can be instantiated', () {
      final source = RBDVolumeSource();
      expect(source, isNotNull);
    });

    test('serializes to JSON correctly', () {
      final source = RBDVolumeSource()
        ..monitors = ['10.16.154.78:6789', '10.16.154.82:6789']
        ..image = 'foo-image'
        ..pool = 'rbd'
        ..user = 'admin'
        ..fsType = 'ext4'
        ..readOnly = false
        ..keyring = '/etc/ceph/keyring'
        ..secretRef = (LocalObjectReference()..name = 'ceph-secret');

      final json = source.toJson();

      expect(json, {
        'monitors': ['10.16.154.78:6789', '10.16.154.82:6789'],
        'image': 'foo-image',
        'pool': 'rbd',
        'user': 'admin',
        'fsType': 'ext4',
        'readOnly': false,
        'keyring': '/etc/ceph/keyring',
        'secretRef': {'name': 'ceph-secret'},
      });
    });

    test('deserializes from JSON correctly', () {
      final json = {
        'monitors': ['10.16.154.78:6789', '10.16.154.82:6789'],
        'image': 'foo-image',
        'pool': 'rbd',
        'user': 'admin',
        'fsType': 'ext4',
        'readOnly': true,
        'keyring': '/etc/ceph/keyring',
        'secretRef': {'name': 'ceph-secret'},
      };

      final source = RBDVolumeSource.fromJson(json);

      expect(
          source.monitors, equals(['10.16.154.78:6789', '10.16.154.82:6789']));
      expect(source.image, equals('foo-image'));
      expect(source.pool, equals('rbd'));
      expect(source.user, equals('admin'));
      expect(source.fsType, equals('ext4'));
      expect(source.readOnly, isTrue);
      expect(source.keyring, equals('/etc/ceph/keyring'));
      expect(source.secretRef?.name, equals('ceph-secret'));
    });

    test('handles multiple monitor entries', () {
      final source = RBDVolumeSource()
        ..monitors = [
          '10.16.154.78:6789',
          '10.16.154.82:6789',
          '10.16.154.83:6789'
        ]
        ..image = 'foo-image'
        ..fsType = 'ext4';

      final json = source.toJson();
      final deserialized = RBDVolumeSource.fromJson(json);

      expect(
          deserialized.monitors,
          equals(
              ['10.16.154.78:6789', '10.16.154.82:6789', '10.16.154.83:6789']));
    });
  });
}
