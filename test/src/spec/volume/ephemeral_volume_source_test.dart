import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/ephemeral_volume_source.dart';
import 'package:kuberneteslib/src/spec/persistent_volume_claim_template.dart';
import 'package:kuberneteslib/src/spec/persistent_volume_claim_spec.dart';
import 'package:kuberneteslib/src/spec/resource_requirements.dart';

void main() {
  group('EphemeralVolumeSource', () {
    test('can be instantiated', () {
      final source = EphemeralVolumeSource();
      expect(source, isNotNull);
    });

    test('can be created with volumeClaimTemplate', () {
      final source = EphemeralVolumeSource()
        ..volumeClaimTemplate = PersistentVolumeClaimTemplate();
      expect(source.volumeClaimTemplate, isNotNull);
    });

    test('serializes to JSON', () {
      final source = EphemeralVolumeSource()
        ..volumeClaimTemplate = (PersistentVolumeClaimTemplate()
          ..spec = (PersistentVolumeClaimSpec()
            ..accessModes = ['ReadWriteOnce']
            ..resources = (ResourceRequirements()
              ..requests = {'storage': '10Gi'})));

      final json = source.toJson();
      
      expect(json, isA<Map<String, dynamic>>());
      expect(json['volumeClaimTemplate'], isNotNull);
      expect(json['volumeClaimTemplate']['spec']['accessModes'], ['ReadWriteOnce']);
      expect(json['volumeClaimTemplate']['spec']['resources']['requests']['storage'], '10Gi');
    });

    test('deserializes from JSON', () {
      final json = {
        'volumeClaimTemplate': {
          'spec': {
            'accessModes': ['ReadWriteOnce'],
            'resources': {
              'requests': {'storage': '10Gi'}
            }
          }
        }
      };

      final source = EphemeralVolumeSource.fromJson(json);
      
      expect(source, isA<EphemeralVolumeSource>());
      expect(source.volumeClaimTemplate, isNotNull);
      expect(source.volumeClaimTemplate!.spec!.accessModes, ['ReadWriteOnce']);
      expect(source.volumeClaimTemplate!.spec!.resources!.requests!['storage'].toString(), '10Gi');
    });
  });
} 