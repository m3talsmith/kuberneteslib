import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/scale_io_volume_source.dart';
import 'package:kuberneteslib/src/spec/local_object_reference.dart';

void main() {
  group('ScaleIOVolumeSource', () {
    test('can be instantiated', () {
      final source = ScaleIOVolumeSource(
        fsType: 'ext4',
        gateway: 'https://localhost:443/api',
        protectionDomain: 'default',
        readOnly: false,
        secretRef: LocalObjectReference()..name = 'scaleio-secret',
        sslEnabled: true,
        storageMode: 'ThinProvisioned',
        storagePool: 'default',
        system: 'scaleio',
        volumeName: 'vol-1',
      );
      expect(source, isNotNull);
    });

    test('serializes to JSON correctly', () {
      final source = ScaleIOVolumeSource(
        fsType: 'ext4',
        gateway: 'https://localhost:443/api',
        protectionDomain: 'default',
        readOnly: false,
        secretRef: LocalObjectReference()..name = 'scaleio-secret',
        sslEnabled: true,
        storageMode: 'ThinProvisioned',
        storagePool: 'default',
        system: 'scaleio',
        volumeName: 'vol-1',
      );

      final json = source.toJson();

      expect(json, {
        'fsType': 'ext4',
        'gateway': 'https://localhost:443/api',
        'protectionDomain': 'default',
        'readOnly': false,
        'secretRef': {'name': 'scaleio-secret'},
        'sslEnabled': true,
        'storageMode': 'ThinProvisioned',
        'storagePool': 'default',
        'system': 'scaleio',
        'volumeName': 'vol-1',
      });
    });

    test('deserializes from JSON correctly', () {
      final json = {
        'fsType': 'ext4',
        'gateway': 'https://localhost:443/api',
        'protectionDomain': 'default',
        'readOnly': true,
        'secretRef': {'name': 'scaleio-secret'},
        'sslEnabled': true,
        'storageMode': 'ThinProvisioned',
        'storagePool': 'default',
        'system': 'scaleio',
        'volumeName': 'vol-1',
      };

      final source = ScaleIOVolumeSource.fromJson(json);

      expect(source.fsType, equals('ext4'));
      expect(source.gateway, equals('https://localhost:443/api'));
      expect(source.protectionDomain, equals('default'));
      expect(source.readOnly, isTrue);
      expect(source.secretRef?.name, equals('scaleio-secret'));
      expect(source.sslEnabled, isTrue);
      expect(source.storageMode, equals('ThinProvisioned'));
      expect(source.storagePool, equals('default'));
      expect(source.system, equals('scaleio'));
      expect(source.volumeName, equals('vol-1'));
    });
  });
}
