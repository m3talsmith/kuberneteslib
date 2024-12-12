import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/projection/secret_projection.dart';
import 'package:kuberneteslib/src/spec/key_to_path.dart';

void main() {
  group('SecretProjection', () {
    test('can be instantiated', () {
      final secretProjection = SecretProjection();
      expect(secretProjection, isNotNull);
    });

    test('supports JSON serialization', () {
      final secretProjection = SecretProjection()
        ..name = 'test-secret'
        ..optional = true
        ..items = [
          KeyToPath()
            ..key = 'secret-key'
            ..path = 'path/to/secret'
        ];

      final json = secretProjection.toJson();
      expect(json, {
        'name': 'test-secret',
        'optional': true,
        'items': [
          {
            'key': 'secret-key',
            'path': 'path/to/secret',
          }
        ],
      });

      final deserialized = SecretProjection.fromJson(json);
      expect(deserialized.name, equals('test-secret'));
      expect(deserialized.optional, isTrue);
      expect(deserialized.items?.length, equals(1));
      expect(deserialized.items?.first.key, equals('secret-key'));
      expect(deserialized.items?.first.path, equals('path/to/secret'));
    });

    test('supports optional fields', () {
      final minimalProjection = SecretProjection()
        ..name = 'minimal-secret';

      final json = minimalProjection.toJson();
      expect(json, {
        'name': 'minimal-secret',
      });
      expect(json.containsKey('optional'), isFalse);
      expect(json.containsKey('items'), isFalse);
    });

    test('supports fromMap factory constructor', () {
      final map = {
        'name': 'map-secret',
        'optional': false,
      };

      final projection = SecretProjection.fromMap(map);
      expect(projection.name, equals('map-secret'));
      expect(projection.optional, isFalse);
    });
  });
} 