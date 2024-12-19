import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/secret_volume_source.dart';
import 'package:kuberneteslib/src/spec/key_to_path.dart';

void main() {
  group('SecretVolumeSource', () {
    test('can be instantiated', () {
      final source = SecretVolumeSource()
        ..defaultMode = '0644'
        ..secretName = 'app-secrets'
        ..optional = false
        ..items = [
          KeyToPath()
            ..key = 'api-key'
            ..path = 'config/api-key.txt'
            ..mode = '0400',
        ];
      expect(source, isNotNull);
    });

    test('serializes to JSON correctly', () {
      final source = SecretVolumeSource()
        ..defaultMode = '0644'
        ..secretName = 'app-secrets'
        ..optional = false
        ..items = [
          KeyToPath()
            ..key = 'api-key'
            ..path = 'config/api-key.txt'
            ..mode = '0400',
        ];

      final json = source.toJson();

      expect(json, {
        'defaultMode': '0644',
        'secretName': 'app-secrets',
        'optional': false,
        'items': [
          {
            'key': 'api-key',
            'path': 'config/api-key.txt',
            'mode': '0400',
          }
        ],
      });
    });

    test('deserializes from JSON correctly', () {
      final json = {
        'defaultMode': '0644',
        'secretName': 'app-secrets',
        'optional': true,
        'items': [
          {
            'key': 'api-key',
            'path': 'config/api-key.txt',
            'mode': '0400',
          }
        ],
      };

      final source = SecretVolumeSource.fromJson(json);

      expect(source.defaultMode, equals(420));
      expect(source.secretName, equals('app-secrets'));
      expect(source.optional, isTrue);
      expect(source.items, hasLength(1));
      expect(source.items?.first.key, equals('api-key'));
      expect(source.items?.first.path, equals('config/api-key.txt'));
      expect(source.items?.first.mode, equals(256));
    });

    test('handles null values correctly', () {
      final source = SecretVolumeSource();
      final json = source.toJson();

      expect(json, isEmpty);

      final deserialized = SecretVolumeSource.fromJson({});
      expect(deserialized.defaultMode, isNull);
      expect(deserialized.secretName, isNull);
      expect(deserialized.optional, isNull);
      expect(deserialized.items, isNull);
    });
  });
}
