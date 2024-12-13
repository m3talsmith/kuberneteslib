import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/glusterfs_volume_source.dart';

void main() {
  group('GlusterfsVolumeSource', () {
    test('can be instantiated', () {
      final source = GlusterfsVolumeSource();
      expect(source, isNotNull);
    });

    test('can be created from JSON', () {
      final json = {
        'endpoint': 'glusterfs-cluster',
        'path': 'myvolume',
        'readOnly': true,
      };

      final source = GlusterfsVolumeSource.fromJson(json);
      
      expect(source.endpoint, 'glusterfs-cluster');
      expect(source.path, 'myvolume');
      expect(source.readOnly, true);
    });

    test('can be converted to JSON', () {
      final source = GlusterfsVolumeSource()
        ..endpoint = 'glusterfs-cluster'
        ..path = 'myvolume'
        ..readOnly = true;

      final json = source.toJson();
      
      expect(json, {
        'endpoint': 'glusterfs-cluster',
        'path': 'myvolume',
        'readOnly': true,
      });
    });

    test('supports value equality', () {
      final source1 = GlusterfsVolumeSource()
        ..endpoint = 'glusterfs-cluster'
        ..path = 'myvolume'
        ..readOnly = true;

      final source2 = GlusterfsVolumeSource()
        ..endpoint = 'glusterfs-cluster'
        ..path = 'myvolume'
        ..readOnly = true;

      expect(source1.toJson(), equals(source2.toJson()));
    });
  });
} 