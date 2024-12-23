import 'package:kuberneteslib/src/spec/volume_device.dart';
import 'package:test/test.dart';

void main() {
  group('VolumeDevice', () {
    test('can be instantiated', () {
      final device = VolumeDevice();
      expect(device, isNotNull);
    });

    test('can be instantiated with all properties', () {
      final device = VolumeDevice(
        devicePath: '/dev/xvdf',
        name: 'data-volume',
      );
      expect(device.devicePath, '/dev/xvdf');
      expect(device.name, 'data-volume');
    });

    group('JSON serialization', () {
      test('toJson() creates correct JSON', () {
        final device = VolumeDevice(
          devicePath: '/dev/xvdf',
          name: 'data-volume',
        );

        final json = device.toJson();
        expect(json, {
          'devicePath': '/dev/xvdf',
          'name': 'data-volume',
        });
      });

      test('fromJson() creates correct object', () {
        final json = {
          'devicePath': '/dev/xvdf',
          'name': 'data-volume',
        };

        final device = VolumeDevice.fromJson(json);
        expect(device.devicePath, '/dev/xvdf');
        expect(device.name, 'data-volume');
      });

      test('toJson() omits null values', () {
        final device = VolumeDevice();
        final json = device.toJson();
        expect(json, isEmpty);
      });

      test('fromJson() handles missing optional values', () {
        final device = VolumeDevice.fromJson({});
        expect(device.devicePath, isNull);
        expect(device.name, isNull);
      });
    });
  });
}
