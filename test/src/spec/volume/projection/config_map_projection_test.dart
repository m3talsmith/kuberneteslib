import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/projection/config_map_projection.dart';
import 'package:kuberneteslib/src/spec/key_to_path.dart';

void main() {
  group('ConfigMapProjection', () {
    test('can be instantiated', () {
      final projection = ConfigMapProjection();
      expect(projection, isNotNull);
    });

    test('supports JSON serialization', () {
      final projection = ConfigMapProjection()
        ..name = 'test-config'
        ..optional = true
        ..items = [
          KeyToPath()
            ..key = 'config.json'
            ..path = 'app/config.json'
        ];

      final json = projection.toJson();
      expect(json, {
        'name': 'test-config',
        'optional': true,
        'items': [
          {
            'key': 'config.json',
            'path': 'app/config.json',
          }
        ],
      });
    });

    test('supports JSON deserialization', () {
      final json = {
        'name': 'test-config',
        'optional': true,
        'items': [
          {
            'key': 'config.json',
            'path': 'app/config.json',
          }
        ],
      };

      final projection = ConfigMapProjection.fromJson(json);
      expect(projection.name, equals('test-config'));
      expect(projection.optional, isTrue);
      expect(projection.items, hasLength(1));
      expect(projection.items![0].key, equals('config.json'));
      expect(projection.items![0].path, equals('app/config.json'));
    });

    test('omits null values in JSON serialization', () {
      final projection = ConfigMapProjection()..name = 'test-config';

      final json = projection.toJson();
      expect(json, {
        'name': 'test-config',
      });
      expect(json.containsKey('optional'), isFalse);
      expect(json.containsKey('items'), isFalse);
    });

    test('fromMap factory creates valid instance', () {
      final map = {
        'name': 'test-config',
        'optional': true,
      };

      final projection = ConfigMapProjection.fromMap(map);
      expect(projection.name, equals('test-config'));
      expect(projection.optional, isTrue);
    });

    test('handles empty items list', () {
      final projection = ConfigMapProjection()
        ..name = 'test-config'
        ..items = [];

      final json = projection.toJson();
      expect(json, {
        'name': 'test-config',
        'items': [],
      });
    });

    test('handles null items list during deserialization', () {
      final json = {
        'name': 'test-config',
        'items': null,
      };

      final projection = ConfigMapProjection.fromJson(json);
      expect(projection.name, equals('test-config'));
      expect(projection.items, isNull);
    });

    test('preserves mode in items during serialization', () {
      final projection = ConfigMapProjection()
        ..name = 'test-config'
        ..items = [
          KeyToPath()
            ..key = 'config.json'
            ..path = 'app/config.json'
            ..mode = 0644
        ];

      final json = projection.toJson();
      expect(json['items'][0]['mode'], equals(0644));
    });

    test('fromMap handles missing optional fields', () {
      final map = {'name': 'test-config'};

      final projection = ConfigMapProjection.fromMap(map);
      expect(projection.name, equals('test-config'));
      expect(projection.optional, isNull);
      expect(projection.items, isNull);
    });

    test('handles multiple items with different modes', () {
      final projection = ConfigMapProjection()
        ..name = 'test-config'
        ..items = [
          KeyToPath()
            ..key = 'config1.json'
            ..path = 'app/config1.json'
            ..mode = 0644,
          KeyToPath()
            ..key = 'config2.json'
            ..path = 'app/config2.json'
            ..mode = 0755,
        ];

      final json = projection.toJson();
      expect(json['items'], hasLength(2));
      expect(json['items'][0]['mode'], equals(0644));
      expect(json['items'][1]['mode'], equals(0755));
    });

    test('fromJson handles empty map', () {
      final projection = ConfigMapProjection.fromJson({});
      expect(projection.name, isNull);
      expect(projection.optional, isNull);
      expect(projection.items, isNull);
    });

    test('handles invalid mode values gracefully', () {
      final projection = ConfigMapProjection()
        ..name = 'test-config'
        ..items = [
          KeyToPath()
            ..key = 'config.json'
            ..path = 'app/config.json'
            ..mode = -1 // Invalid mode
        ];

      final json = projection.toJson();
      expect(json['items'][0]['mode'], equals(-1));
    });
  });
}
