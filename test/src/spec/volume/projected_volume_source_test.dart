import 'package:kuberneteslib/src/spec/volume/volume_projection.dart';
import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/projected_volume_source.dart';
import 'package:kuberneteslib/src/spec/volume/projection/secret_projection.dart';
import 'package:kuberneteslib/src/spec/volume/projection/config_map_projection.dart';
import 'package:kuberneteslib/src/spec/volume/projection/downward_api_projection.dart';
import 'package:kuberneteslib/src/spec/volume/projection/service_account_token_projection.dart';

void main() {
  group('ProjectedVolumeSource', () {
    test('can be instantiated', () {
      final source = ProjectedVolumeSource();
      expect(source, isNotNull);
      expect(source.defaultMode, isNull);
      expect(source.sources, isNull);
    });

    test('serializes to JSON correctly', () {
      final source = ProjectedVolumeSource()
        ..defaultMode = 420 // equivalent to 0644 octal
        ..sources = [
          VolumeProjection()
            ..secret = (SecretProjection()
              ..name = 'my-secret'
              ..items = [])
        ];

      final json = source.toJson();

      expect(json, {
        'defaultMode': 420,
        'sources': [
          {
            'secret': {
              'name': 'my-secret',
              'items': [],
            }
          }
        ]
      });
    });

    test('deserializes from JSON correctly', () {
      final json = {
        'defaultMode': 420,
        'sources': [
          {
            'secret': {
              'name': 'my-secret',
              'items': [],
            }
          }
        ]
      };

      final source = ProjectedVolumeSource.fromJson(json);

      expect(source.defaultMode, equals(420));
      expect(source.sources, hasLength(1));
      expect(source.sources![0].secret?.name, equals('my-secret'));
    });

    test('handles multiple projection types', () {
      final source = ProjectedVolumeSource()
        ..defaultMode = 420
        ..sources = [
          VolumeProjection()..secret = (SecretProjection()..name = 'secret-1'),
          VolumeProjection()
            ..configMap = (ConfigMapProjection()..name = 'config-1'),
          VolumeProjection()..downwardAPI = DownwardAPIProjection(),
          VolumeProjection()
            ..serviceAccountToken = (ServiceAccountTokenProjection()
              ..audience = 'api'
              ..expirationSeconds = 3600
              ..path = 'token')
        ];

      final json = source.toJson();
      final deserialized = ProjectedVolumeSource.fromJson(json);

      expect(deserialized.sources, hasLength(4));
      expect(deserialized.sources![0].secret?.name, equals('secret-1'));
      expect(deserialized.sources![1].configMap?.name, equals('config-1'));
      expect(deserialized.sources![2].downwardAPI, isNotNull);
      expect(deserialized.sources![3].serviceAccountToken?.audience,
          equals('api'));
    });

    test('handles empty sources list', () {
      final source = ProjectedVolumeSource()
        ..defaultMode = 420
        ..sources = [];

      final json = source.toJson();
      expect(json['sources'], isEmpty);
    });

    test('omits null values in JSON', () {
      final source = ProjectedVolumeSource();
      final json = source.toJson();

      expect(json.containsKey('defaultMode'), isFalse);
      expect(json.containsKey('sources'), isFalse);
    });
  });
}
