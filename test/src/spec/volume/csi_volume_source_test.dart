import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/csi_volume_source.dart';
import 'package:kuberneteslib/src/spec/local_object_reference.dart';

void main() {
  group('CSIVolumeSource', () {
    test('can be instantiated', () {
      expect(CSIVolumeSource(), isNotNull);
    });

    test('supports JSON serialization/deserialization', () {
      final source = CSIVolumeSource()
        ..driver = 'ebs.csi.aws.com'
        ..fsType = 'ext4'
        ..readOnly = true
        ..nodePublishSecretRef = (LocalObjectReference()..name = 'secret-name')
        ..volumeAttributes = {
          'size': '10Gi',
          'type': 'gp3',
        };

      final json = source.toJson();
      final restored = CSIVolumeSource.fromJson(json);

      expect(restored.driver, equals('ebs.csi.aws.com'));
      expect(restored.fsType, equals('ext4'));
      expect(restored.readOnly, isTrue);
      expect(restored.nodePublishSecretRef?.name, equals('secret-name'));
      expect(
          restored.volumeAttributes,
          equals({
            'size': '10Gi',
            'type': 'gp3',
          }));
    });

    test('handles empty volumeAttributes', () {
      final source = CSIVolumeSource()
        ..driver = 'test-driver'
        ..fsType = 'ext4'
        ..readOnly = false
        ..nodePublishSecretRef = (LocalObjectReference()..name = 'secret')
        ..volumeAttributes = {};

      final json = source.toJson();
      final restored = CSIVolumeSource.fromJson(json);

      expect(restored.volumeAttributes, isEmpty);
    });

    test('creates valid AWS EBS CSI configuration', () {
      final source = CSIVolumeSource()
        ..driver = 'ebs.csi.aws.com'
        ..fsType = 'ext4'
        ..readOnly = false
        ..nodePublishSecretRef = (LocalObjectReference()..name = 'aws-secret')
        ..volumeAttributes = {
          'size': '10Gi',
          'type': 'gp3',
          'iops': '3000',
        };

      expect(source.driver, equals('ebs.csi.aws.com'));
      expect(source.volumeAttributes?['type'], equals('gp3'));
      expect(source.volumeAttributes?['iops'], equals('3000'));
    });

    test('creates valid GCP PD CSI configuration', () {
      final source = CSIVolumeSource()
        ..driver = 'pd.csi.storage.gke.io'
        ..fsType = 'ext4'
        ..readOnly = false
        ..nodePublishSecretRef = (LocalObjectReference()..name = 'gcp-secret')
        ..volumeAttributes = {
          'type': 'pd-standard',
          'disk-encryption-kms-key':
              'projects/my-project/locations/global/keyRings/my-kr/cryptoKeys/my-key',
        };

      expect(source.driver, equals('pd.csi.storage.gke.io'));
      expect(source.volumeAttributes?['type'], equals('pd-standard'));
      expect(source.volumeAttributes?.containsKey('disk-encryption-kms-key'),
          isTrue);
    });
  });
}
