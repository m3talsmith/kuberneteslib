import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/key_to_path.dart';

void main() {
  group('KeyToPath', () {
    test('can be instantiated', () {
      final keyToPath = KeyToPath();
      expect(keyToPath, isNotNull);
    });

    test('supports JSON serialization', () {
      final keyToPath = KeyToPath(
        key: 'config.json',
        path: 'app/config.json',
        mode: '0644',
      );

      expect(keyToPath.mode, equals(420));

      final json = keyToPath.toJson();
      expect(
          json,
          equals({
            'key': 'config.json',
            'path': 'app/config.json',
            'mode': '0644', // 0644 in decimal
          }));
    });

    test('supports JSON deserialization', () {
      final json = {
        'key': 'secret.key',
        'path': 'secrets/api.key',
        'mode': 384, // 0600 in decimal
      };

      final keyToPath = KeyToPath.fromJson(json);
      expect(keyToPath.key, equals('secret.key'));
      expect(keyToPath.path, equals('secrets/api.key'));
      expect(keyToPath.mode, equals(384));
    });

    test('handles null values during serialization', () {
      final keyToPath = KeyToPath()
        ..key = 'config.json'
        ..path = 'app/config.json';

      final json = keyToPath.toJson();
      expect(json, {
        'key': 'config.json',
        'path': 'app/config.json',
      });
      expect(json.containsKey('mode'), isFalse);
    });

    test('handles partial JSON during deserialization', () {
      final json = {
        'key': 'config.json',
      };

      final keyToPath = KeyToPath.fromJson(json);
      expect(keyToPath.key, equals('config.json'));
      expect(keyToPath.path, isNull);
      expect(keyToPath.mode, isNull);
    });
  });
}
