import 'package:test/test.dart';
import 'package:kuberneteslib/src/meta/owner_reference.dart';

void main() {
  group('OwnerReference', () {

    test('serializes to JSON correctly', () {
      final ref = OwnerReference()
        ..apiVersion = 'apps/v1'
        ..kind = 'Deployment'
        ..name = 'nginx-deployment'
        ..uid = 'abc-123'
        ..controller = true
        ..blockOwnerDeletion = true;

      final json = ref.toJson();
      
      expect(json, {
        'apiVersion': 'apps/v1',
        'kind': 'Deployment',
        'name': 'nginx-deployment',
        'uid': 'abc-123',
        'controller': true,
        'blockOwnerDeletion': true,
      });
    });

    test('deserializes from JSON correctly', () {
      final json = {
        'apiVersion': 'apps/v1',
        'kind': 'Deployment',
        'name': 'nginx-deployment',
        'uid': 'abc-123',
        'controller': true,
        'blockOwnerDeletion': true,
      };

      final ref = OwnerReference.fromJson(json);
      
      expect(ref.apiVersion, 'apps/v1');
      expect(ref.kind, 'Deployment');
      expect(ref.name, 'nginx-deployment');
      expect(ref.uid, 'abc-123');
      expect(ref.controller, true);
      expect(ref.blockOwnerDeletion, true);
    });

    test('handles partial JSON deserialization', () {
      final json = {
        'apiVersion': 'v1',
        'kind': 'Pod',
        'name': 'test-pod',
        // Omitting optional fields
      };

      final ref = OwnerReference.fromJson(json);
      
      expect(ref.apiVersion, 'v1');
      expect(ref.kind, 'Pod');
      expect(ref.name, 'test-pod');
      expect(ref.uid, null);
      expect(ref.controller, null);
      expect(ref.blockOwnerDeletion, null);
    });

    test('supports fluent interface pattern', () {
      final ref = OwnerReference()
        ..apiVersion = 'batch/v1'
        ..kind = 'Job'
        ..name = 'backup-job'
        ..uid = 'def-456'
        ..controller = true
        ..blockOwnerDeletion = false;

      expect(ref.apiVersion, 'batch/v1');
      expect(ref.kind, 'Job');
      expect(ref.name, 'backup-job');
      expect(ref.uid, 'def-456');
      expect(ref.controller, true);
      expect(ref.blockOwnerDeletion, false);
    });

    test('maintains field independence', () {
      final ref1 = OwnerReference()
        ..apiVersion = 'v1'
        ..kind = 'Pod';
      
      final ref2 = OwnerReference()
        ..apiVersion = 'apps/v1'
        ..kind = 'Deployment';

      expect(ref1.apiVersion, 'v1');
      expect(ref1.kind, 'Pod');
      expect(ref2.apiVersion, 'apps/v1');
      expect(ref2.kind, 'Deployment');
    });
  });
} 