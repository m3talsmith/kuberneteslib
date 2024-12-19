import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/config_map_key_selector.dart';

void main() {
  group('ConfigMapKeySelector', () {
    test('can be instantiated', () {
      final selector = ConfigMapKeySelector();
      expect(selector, isNotNull);
    });

    test('can be created with all properties', () {
      final selector = ConfigMapKeySelector()
        ..key = 'database-url'
        ..name = 'app-config'
        ..optional = false;

      expect(selector.key, equals('database-url'));
      expect(selector.name, equals('app-config'));
      expect(selector.optional, equals(false));
    });

    test('serializes to JSON correctly', () {
      final selector = ConfigMapKeySelector()
        ..key = 'database-url'
        ..name = 'app-config'
        ..optional = true;

      final json = selector.toJson();

      expect(
          json,
          equals({
            'key': 'database-url',
            'name': 'app-config',
            'optional': true,
          }));
    });

    test('deserializes from JSON correctly', () {
      final json = {
        'key': 'api-key',
        'name': 'secrets',
        'optional': false,
      };

      final selector = ConfigMapKeySelector.fromJson(json);

      expect(selector.key, equals('api-key'));
      expect(selector.name, equals('secrets'));
      expect(selector.optional, equals(false));
    });
  });
}
