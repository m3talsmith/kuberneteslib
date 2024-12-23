import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/secret_key_selector.dart';

void main() {
  group('SecretKeySelector', () {
    test('can be instantiated', () {
      final selector = SecretKeySelector();
      expect(selector, isNotNull);
    });

    test('supports JSON serialization', () {
      final selector = SecretKeySelector()
        ..key = 'api-key'
        ..name = 'app-secrets'
        ..optional = true;

      final json = selector.toJson();
      expect(json, {
        'key': 'api-key',
        'name': 'app-secrets',
        'optional': true,
      });

      final deserialized = SecretKeySelector.fromJson(json);
      expect(deserialized.key, equals('api-key'));
      expect(deserialized.name, equals('app-secrets'));
      expect(deserialized.optional, isTrue);
    });

    test('omits null values in JSON', () {
      final selector = SecretKeySelector()
        ..key = 'api-key'
        ..name = null
        ..optional = null;

      final json = selector.toJson();
      expect(json, {
        'key': 'api-key',
      });
      expect(json.containsKey('name'), isFalse);
      expect(json.containsKey('optional'), isFalse);
    });

    test('can be created from partial JSON', () {
      final json = {'key': 'database-password'};
      final selector = SecretKeySelector.fromJson(json);

      expect(selector.key, equals('database-password'));
      expect(selector.name, isNull);
      expect(selector.optional, isNull);
    });

    test('handles empty JSON', () {
      final selector = SecretKeySelector.fromJson({});

      expect(selector.key, isNull);
      expect(selector.name, isNull);
      expect(selector.optional, isNull);
    });
  });
}
