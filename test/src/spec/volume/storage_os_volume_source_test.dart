import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/volume_projection.dart';
import 'package:kuberneteslib/src/spec/volume/projection/config_map_projection.dart';
import 'package:kuberneteslib/src/spec/volume/projection/downward_api_projection.dart';
import 'package:kuberneteslib/src/spec/volume/projection/secret_projection.dart';
import 'package:kuberneteslib/src/spec/volume/projection/service_account_token_projection.dart';

void main() {
  group('VolumeProjection', () {
    test('can be instantiated', () {
      final projection = VolumeProjection()
        ..configMap = (ConfigMapProjection()..name = 'test-config')
        ..downwardAPI = DownwardAPIProjection()
        ..secret = (SecretProjection()..name = 'test-secret')
        ..serviceAccountToken = (ServiceAccountTokenProjection()
          ..audience = 'test-audience'
          ..expirationSeconds = 3600
          ..path = '/token');

      expect(projection, isNotNull);
      expect(projection.configMap?.name, equals('test-config'));
      expect(projection.downwardAPI, isNotNull);
      expect(projection.secret?.name, equals('test-secret'));
      expect(projection.serviceAccountToken?.audience, equals('test-audience'));
    });

    test('serializes to JSON correctly', () {
      final projection = VolumeProjection()
        ..configMap = (ConfigMapProjection()..name = 'test-config')
        ..downwardAPI = DownwardAPIProjection()
        ..secret = (SecretProjection()..name = 'test-secret')
        ..serviceAccountToken = (ServiceAccountTokenProjection()
          ..audience = 'test-audience'
          ..expirationSeconds = 3600
          ..path = '/token');

      final json = projection.toJson();

      expect(json, {
        'configMap': {'name': 'test-config'},
        'downwardAPI': {},
        'secret': {'name': 'test-secret'},
        'serviceAccountToken': {
          'audience': 'test-audience',
          'expirationSeconds': 3600,
          'path': '/token'
        }
      });
    });

    test('deserializes from JSON correctly', () {
      final json = {
        'configMap': {'name': 'test-config'},
        'secret': {'name': 'test-secret'},
        'serviceAccountToken': {
          'audience': 'test-audience',
          'expirationSeconds': 3600,
          'path': '/token'
        }
      };

      final projection = VolumeProjection.fromJson(json);

      expect(projection.configMap?.name, equals('test-config'));
      expect(projection.secret?.name, equals('test-secret'));
      expect(projection.serviceAccountToken?.audience, equals('test-audience'));
      expect(projection.serviceAccountToken?.expirationSeconds, equals(3600));
      expect(projection.serviceAccountToken?.path, equals('/token'));
    });

    test('handles null values correctly', () {
      final projection = VolumeProjection();
      final json = projection.toJson();

      expect(json, isEmpty);

      final deserialized = VolumeProjection.fromJson({});
      expect(deserialized.configMap, isNull);
      expect(deserialized.downwardAPI, isNull);
      expect(deserialized.secret, isNull);
      expect(deserialized.serviceAccountToken, isNull);
    });

    test('handles partial initialization', () {
      final projection = VolumeProjection()
        ..configMap = (ConfigMapProjection()..name = 'test-config');

      final json = projection.toJson();

      expect(json, {
        'configMap': {'name': 'test-config'}
      });

      final deserialized = VolumeProjection.fromJson(json);
      expect(deserialized.configMap?.name, equals('test-config'));
      expect(deserialized.downwardAPI, isNull);
      expect(deserialized.secret, isNull);
      expect(deserialized.serviceAccountToken, isNull);
    });
  });
}
