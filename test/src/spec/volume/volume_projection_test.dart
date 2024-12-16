import 'package:kuberneteslib/src/spec/volume/volume_projection.dart';
import 'package:kuberneteslib/src/spec/volume/projection/config_map_projection.dart';
import 'package:kuberneteslib/src/spec/volume/projection/downward_api_projection.dart';
import 'package:kuberneteslib/src/spec/volume/projection/secret_projection.dart';
import 'package:kuberneteslib/src/spec/volume/projection/service_account_token_projection.dart';
import 'package:test/test.dart';

void main() {
  group('VolumeProjection', () {
    test('can be instantiated', () {
      expect(VolumeProjection(), isNotNull);
    });

    group('JSON serialization', () {
      test('toJson produces empty map when no properties are set', () {
        final projection = VolumeProjection();
        expect(projection.toJson(), isEmpty);
      });

      test('fromJson creates empty instance from empty map', () {
        final projection = VolumeProjection.fromJson({});
        expect(projection.configMap, isNull);
        expect(projection.downwardAPI, isNull);
        expect(projection.secret, isNull);
        expect(projection.serviceAccountToken, isNull);
      });

      test('correctly serializes all properties', () {
        final projection = VolumeProjection()
          ..configMap = ConfigMapProjection()
          ..downwardAPI = DownwardAPIProjection()
          ..secret = SecretProjection()
          ..serviceAccountToken = ServiceAccountTokenProjection();

        final json = projection.toJson();

        expect(json['configMap'], isNotNull);
        expect(json['downwardAPI'], isNotNull);
        expect(json['secret'], isNotNull);
        expect(json['serviceAccountToken'], isNotNull);
      });
    });

    group('Property assignments', () {
      late VolumeProjection projection;

      setUp(() {
        projection = VolumeProjection();
      });

      test('can set and get configMap', () {
        final configMap = ConfigMapProjection();
        projection.configMap = configMap;
        expect(projection.configMap, equals(configMap));
      });

      test('can set and get downwardAPI', () {
        final downwardAPI = DownwardAPIProjection();
        projection.downwardAPI = downwardAPI;
        expect(projection.downwardAPI, equals(downwardAPI));
      });

      test('can set and get secret', () {
        final secret = SecretProjection();
        projection.secret = secret;
        expect(projection.secret, equals(secret));
      });

      test('can set and get serviceAccountToken', () {
        final serviceAccountToken = ServiceAccountTokenProjection();
        projection.serviceAccountToken = serviceAccountToken;
        expect(projection.serviceAccountToken, equals(serviceAccountToken));
      });
    });
  });
}
