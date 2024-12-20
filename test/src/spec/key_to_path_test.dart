import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/key_to_path.dart';

void main() {
  group('KeyToPath', () {
    test('can be instantiated', () {
      final keyToPath = KeyToPath();
      expect(keyToPath, isNotNull);
    });

    test('can be instantiated with values', () {
      final keyToPath = KeyToPath(
        key: 'config.json',
        path: 'app/config.json',
        mode: 0644,
      );

      expect(keyToPath.key, equals('config.json'));
      expect(keyToPath.path, equals('app/config.json'));
      expect(keyToPath.mode, equals(420)); // 0644 in decimal
    });

    group('JSON', () {
      test('serializes to JSON correctly', () {
        final keyToPath = KeyToPath(
          key: 'config.json',
          path: 'app/config.json',
          mode: 0644,
        );

        final json = keyToPath.toJson();
        expect(json, {
          'key': 'config.json',
          'path': 'app/config.json',
          'mode': '0644',
        });
      });

      test('deserializes from JSON correctly', () {
        final json = {
          'key': 'config.json',
          'path': 'app/config.json',
          'mode': '0644',
        };

        final keyToPath = KeyToPath.fromJson(json);
        expect(keyToPath.key, equals('config.json'));
        expect(keyToPath.path, equals('app/config.json'));
        expect(keyToPath.mode, equals(420));
      });

      test('omits null values in JSON', () {
        final keyToPath = KeyToPath();
        final json = keyToPath.toJson();
        expect(json, isEmpty);
      });
    });

    group('mode handling', () {
      test('accepts octal mode values', () {
        final keyToPath = KeyToPath(mode: 0644);
        expect(keyToPath.mode, equals(420)); // 0644 in decimal
      });

      test('accepts decimal mode values', () {
        final keyToPath = KeyToPath(mode: 420);
        expect(keyToPath.mode, equals(420));
      });

      test('accepts string mode values', () {
        final keyToPath = KeyToPath(mode: '0644');
        expect(keyToPath.mode, equals(420));
      });
    });
  });
}
