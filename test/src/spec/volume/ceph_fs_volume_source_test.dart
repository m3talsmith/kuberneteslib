import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/ceph_fs_volume_source.dart';
import 'package:kuberneteslib/src/spec/local_object_reference.dart';

void main() {
  group('CephFSVolumeSource', () {
    test('can be instantiated', () {
      final cephfs = CephFSVolumeSource();
      expect(cephfs, isNotNull);
    });

    test('supports JSON serialization', () {
      final cephfs = CephFSVolumeSource()
        ..monitors = ['10.16.154.78:6789', '10.16.154.82:6789']
        ..path = '/mysql_data'
        ..user = 'admin'
        ..secretFile = '/etc/ceph/user.keyring'
        ..secretRef = (LocalObjectReference()..name = 'ceph-secret')
        ..readOnly = true;

      final json = cephfs.toJson();
      final fromJson = CephFSVolumeSource.fromJson(json);

      expect(fromJson.monitors, equals(['10.16.154.78:6789', '10.16.154.82:6789']));
      expect(fromJson.path, equals('/mysql_data'));
      expect(fromJson.user, equals('admin'));
      expect(fromJson.secretFile, equals('/etc/ceph/user.keyring'));
      expect(fromJson.secretRef?.name, equals('ceph-secret'));
      expect(fromJson.readOnly, isTrue);
    });

    test('handles minimal configuration', () {
      final cephfs = CephFSVolumeSource()
        ..monitors = ['10.16.154.78:6789'];

      final json = cephfs.toJson();
      expect(json['monitors'], equals(['10.16.154.78:6789']));
    });

    test('serializes empty values', () {
      final cephfs = CephFSVolumeSource()
        ..monitors = []
        ..path = ''
        ..user = ''
        ..secretFile = ''
        ..secretRef = (LocalObjectReference()..name = '')
        ..readOnly = false;

      final json = cephfs.toJson();
      expect(json['monitors'], isEmpty);
      expect(json['path'], isEmpty);
      expect(json['user'], isEmpty);
      expect(json['secretFile'], isEmpty);
      expect(json['secretRef']['name'], isEmpty);
      expect(json['readOnly'], isFalse);
    });
  });
} 