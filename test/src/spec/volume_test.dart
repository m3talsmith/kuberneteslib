import 'package:kuberneteslib/src/spec/volume.dart';
import 'package:kuberneteslib/src/spec/volume/config_map_volume_source.dart';
import 'package:kuberneteslib/src/spec/volume/empty_dir_volume_source.dart';
import 'package:kuberneteslib/src/spec/volume/host_path_volume_source.dart';
import 'package:kuberneteslib/src/spec/volume/persistent_volume_claim_volume_source.dart';
import 'package:kuberneteslib/src/spec/volume/secret_volume_source.dart';
import 'package:test/test.dart';

void main() {
  group('Volume', () {
    test('can be instantiated', () {
      final volume = Volume();
      expect(volume, isNotNull);
    });

    test('supports JSON serialization', () {
      final volume = Volume()..name = 'test-volume';

      final json = volume.toJson();
      final deserialized = Volume.fromJson(json);

      expect(deserialized.name, equals('test-volume'));
    });

    test('configMap volume serialization', () {
      final volume = Volume()
        ..name = 'config-volume'
        ..configMap = (ConfigMapVolumeSource()
          ..name = 'app-config'
          ..defaultMode = 420);

      final json = volume.toJson();
      expect(json['name'], equals('config-volume'));
      expect(json['configMap']['name'], equals('app-config'));
      expect(json['configMap']['defaultMode'], equals(420));

      final deserialized = Volume.fromJson(json);
      expect(deserialized.name, equals('config-volume'));
      expect(deserialized.configMap?.name, equals('app-config'));
      expect(deserialized.configMap?.defaultMode, equals(420));
    });

    test('emptyDir volume serialization', () {
      final volume = Volume()
        ..name = 'cache-volume'
        ..emptyDir = (EmptyDirVolumeSource()
          ..sizeLimit = '1Gi'
          ..medium = 'Memory');

      final json = volume.toJson();
      expect(json['name'], equals('cache-volume'));
      expect(json['emptyDir']['sizeLimit'], equals('1Gi'));
      expect(json['emptyDir']['medium'], equals('Memory'));

      final deserialized = Volume.fromJson(json);
      expect(deserialized.name, equals('cache-volume'));
      expect(deserialized.emptyDir?.sizeLimit, equals('1Gi'));
      expect(deserialized.emptyDir?.medium, equals('Memory'));
    });

    test('persistentVolumeClaim volume serialization', () {
      final volume = Volume()
        ..name = 'pvc-volume'
        ..persistentVolumeClaim = (PersistentVolumeClaimVolumeSource()
          ..claimName = 'my-claim'
          ..readOnly = true);

      final json = volume.toJson();
      expect(json['name'], equals('pvc-volume'));
      expect(json['persistentVolumeClaim']['claimName'], equals('my-claim'));
      expect(json['persistentVolumeClaim']['readOnly'], isTrue);

      final deserialized = Volume.fromJson(json);
      expect(deserialized.name, equals('pvc-volume'));
      expect(deserialized.persistentVolumeClaim?.claimName, equals('my-claim'));
      expect(deserialized.persistentVolumeClaim?.readOnly, isTrue);
    });

    test('hostPath volume serialization', () {
      final volume = Volume()
        ..name = 'host-volume'
        ..hostPath = (HostPathVolumeSource()
          ..path = '/data'
          ..type = 'Directory');

      final json = volume.toJson();
      expect(json['name'], equals('host-volume'));
      expect(json['hostPath']['path'], equals('/data'));
      expect(json['hostPath']['type'], equals('Directory'));

      final deserialized = Volume.fromJson(json);
      expect(deserialized.name, equals('host-volume'));
      expect(deserialized.hostPath?.path, equals('/data'));
      expect(deserialized.hostPath?.type, equals('Directory'));
    });

    test('secret volume serialization', () {
      final volume = Volume()
        ..name = 'secret-volume'
        ..secret = (SecretVolumeSource()
          ..secretName = 'my-secret'
          ..defaultMode = '0600'); // 0600 in octal

      final json = volume.toJson();

      final deserialized = Volume.fromJson(json);
      expect(deserialized.toJson(), equals(json));
    });

    test('handles null values correctly', () {
      final volume = Volume();
      final json = volume.toJson();

      expect(json.containsKey('name'), isFalse);
      expect(json.containsKey('configMap'), isFalse);
      expect(json.containsKey('emptyDir'), isFalse);
      expect(json.containsKey('secret'), isFalse);
    });

    test('complex volume configuration', () {
      final volume = Volume()
        ..name = 'complex-volume'
        ..configMap = (ConfigMapVolumeSource()
          ..name = 'app-config'
          ..defaultMode = 420)
        ..emptyDir = (EmptyDirVolumeSource()..sizeLimit = '1Gi')
        ..secret = (SecretVolumeSource()..secretName = 'app-secrets');

      final json = volume.toJson();
      final deserialized = Volume.fromJson(json);

      expect(deserialized.name, equals('complex-volume'));
      expect(deserialized.configMap?.name, equals('app-config'));
      expect(deserialized.emptyDir?.sizeLimit, equals('1Gi'));
      expect(deserialized.secret?.secretName, equals('app-secrets'));
    });
  });
}
