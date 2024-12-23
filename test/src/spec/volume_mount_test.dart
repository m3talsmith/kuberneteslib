import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume_mount.dart';

void main() {
  group('VolumeMount', () {
    test('can be instantiated', () {
      final mount = VolumeMount();
      expect(mount, isNotNull);
    });

    test('supports value comparison', () {
      final mount1 = VolumeMount(
        name: 'config-volume',
        mountPath: '/etc/config',
        readOnly: true,
      );

      final mount2 = VolumeMount(
        name: 'config-volume',
        mountPath: '/etc/config',
        readOnly: true,
      );

      expect(mount1.toJson(), equals(mount2.toJson()));
    });

    group('serialization', () {
      test('can be serialized to JSON', () {
        final mount = VolumeMount(
          name: 'data-volume',
          mountPath: '/mnt/data',
          readOnly: true,
          subPath: 'configs',
          subPathExpr: r'$(POD_NAME)/data',
        );

        final json = mount.toJson();
        expect(json, {
          'name': 'data-volume',
          'mountPath': '/mnt/data',
          'readOnly': true,
          'subPath': 'configs',
          'subPathExpr': r'$(POD_NAME)/data',
        });
      });

      test('can be deserialized from JSON', () {
        final json = {
          'name': 'config-volume',
          'mountPath': '/etc/config',
          'readOnly': true,
          'mountPropagation': 'Bidirectional',
          'subPath': 'settings',
          'subPathExpr': r'$(NODE_NAME)/config',
        };

        final mount = VolumeMount.fromJson(json);
        expect(mount.name, equals('config-volume'));
        expect(mount.mountPath, equals('/etc/config'));
        expect(mount.readOnly, isTrue);
        expect(mount.mountPropagation, equals('Bidirectional'));
        expect(mount.subPath, equals('settings'));
        expect(mount.subPathExpr, equals(r'$(NODE_NAME)/config'));
      });

      test('omits null values during serialization', () {
        final mount = VolumeMount(
          name: 'data-volume',
          mountPath: '/mnt/data',
        );

        final json = mount.toJson();
        expect(json, {
          'name': 'data-volume',
          'mountPath': '/mnt/data',
        });
        expect(json.containsKey('readOnly'), isFalse);
        expect(json.containsKey('subPath'), isFalse);
        expect(json.containsKey('subPathExpr'), isFalse);
        expect(json.containsKey('mountPropagation'), isFalse);
      });
    });

    group('validation', () {
      test('accepts valid mount propagation values', () {
        final mount = VolumeMount()..mountPropagation = 'None';
        expect(mount.mountPropagation, equals('None'));

        mount.mountPropagation = 'HostToContainer';
        expect(mount.mountPropagation, equals('HostToContainer'));

        mount.mountPropagation = 'Bidirectional';
        expect(mount.mountPropagation, equals('Bidirectional'));
      });
    });
  });
}
