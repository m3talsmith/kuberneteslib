import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/projection/service_account_token_projection.dart';

void main() {
  group('ServiceAccountTokenProjection', () {
    test('can be instantiated', () {
      final projection = ServiceAccountTokenProjection();
      expect(projection, isNotNull);
    });

    test('supports JSON serialization', () {
      final projection = ServiceAccountTokenProjection()
        ..audience = 'https://api.example.com'
        ..expirationSeconds = 7200
        ..path = '/var/run/secrets/tokens/api-token';

      final json = projection.toJson();
      expect(json, {
        'audience': 'https://api.example.com',
        'expirationSeconds': 7200,
        'path': '/var/run/secrets/tokens/api-token',
      });
    });

    test('supports JSON deserialization', () {
      final json = {
        'audience': 'https://api.example.com',
        'expirationSeconds': 7200,
        'path': '/var/run/secrets/tokens/api-token',
      };

      final projection = ServiceAccountTokenProjection.fromJson(json);

      expect(projection.audience, 'https://api.example.com');
      expect(projection.expirationSeconds, 7200);
      expect(projection.path, '/var/run/secrets/tokens/api-token');
    });

    test('fromMap is equivalent to fromJson', () {
      final data = {
        'audience': 'https://api.example.com',
        'expirationSeconds': 7200,
        'path': '/var/run/secrets/tokens/api-token',
      };

      final fromMap = ServiceAccountTokenProjection.fromMap(data);
      final fromJson = ServiceAccountTokenProjection.fromJson(data);

      expect(fromMap.toJson(), equals(fromJson.toJson()));
    });

    test('null values are excluded from JSON', () {
      final projection = ServiceAccountTokenProjection();

      expect(projection.toJson(), isEmpty);
    });
  });
}
