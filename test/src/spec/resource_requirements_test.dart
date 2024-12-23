import 'package:kuberneteslib/src/spec/resource_claim.dart';
import 'package:kuberneteslib/src/spec/resource_requirements.dart';
import 'package:test/test.dart';

void main() {
  group('ResourceRequirements', () {
    test('can be instantiated', () {
      final requirements = ResourceRequirements();
      expect(requirements, isNotNull);
    });

    test('supports JSON serialization', () {
      final requirements = ResourceRequirements(
        requests: {
          'cpu': '500m',
          'memory': '256Mi',
        },
        limits: {
          'cpu': '1',
          'memory': '512Mi',
        },
        claims: [
          ResourceClaim()..name = 'gpu-claim',
        ],
      );

      final json = requirements.toJson();
      expect(json, {
        'requests': {
          'cpu': '500m',
          'memory': '256Mi',
        },
        'limits': {
          'cpu': '1',
          'memory': '512Mi',
        },
        'claims': [
          {'name': 'gpu-claim'},
        ],
      });

      final deserialized = ResourceRequirements.fromJson(json);
      expect(deserialized.requests, requirements.requests);
      expect(deserialized.limits, requirements.limits);
      expect(deserialized.claims?.first.name, requirements.claims?.first.name);
    });

    test('handles null values correctly', () {
      final requirements = ResourceRequirements();
      final json = requirements.toJson();
      expect(json, isEmpty);

      final deserialized = ResourceRequirements.fromJson(json);
      expect(deserialized.requests, isNull);
      expect(deserialized.limits, isNull);
      expect(deserialized.claims, isNull);
    });

    test('handles partial initialization', () {
      final requirements = ResourceRequirements(
        requests: {'cpu': '250m'},
      );

      final json = requirements.toJson();
      expect(json, {
        'requests': {'cpu': '250m'},
      });

      final deserialized = ResourceRequirements.fromJson(json);
      expect(deserialized.requests, {'cpu': '250m'});
      expect(deserialized.limits, isNull);
      expect(deserialized.claims, isNull);
    });

    test('supports common resource types', () {
      final requirements = ResourceRequirements(
        requests: {
          'cpu': '500m',
          'memory': '256Mi',
          'ephemeral-storage': '1Gi',
          'example.com/custom-resource': '1',
        },
        limits: {
          'cpu': '1',
          'memory': '512Mi',
          'ephemeral-storage': '2Gi',
          'example.com/custom-resource': '2',
        },
      );

      final json = requirements.toJson();
      final deserialized = ResourceRequirements.fromJson(json);

      expect(deserialized.requests, requirements.requests);
      expect(deserialized.limits, requirements.limits);
    });
  });
}
