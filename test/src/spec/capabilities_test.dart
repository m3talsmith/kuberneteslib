import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/capabilities.dart';

void main() {
  group('Capabilities', () {
    test('can be instantiated', () {
      final capabilities = Capabilities();
      expect(capabilities.add, isNull);
      expect(capabilities.drop, isNull);
    });

    test('supports adding capabilities', () {
      final capabilities = Capabilities()..add = ['NET_ADMIN', 'SYS_TIME'];
      expect(capabilities.add, equals(['NET_ADMIN', 'SYS_TIME']));
    });

    test('supports dropping capabilities', () {
      final capabilities = Capabilities()..drop = ['ALL'];
      expect(capabilities.drop, equals(['ALL']));
    });

    group('JSON serialization', () {
      test('toJson produces correct output with null values', () {
        final capabilities = Capabilities();
        final json = capabilities.toJson();
        expect(json, isEmpty);
      });

      test('toJson produces correct output with values', () {
        final capabilities = Capabilities()
          ..add = ['NET_ADMIN']
          ..drop = ['SYS_ADMIN'];

        final json = capabilities.toJson();
        expect(
            json,
            equals({
              'add': ['NET_ADMIN'],
              'drop': ['SYS_ADMIN'],
            }));
      });

      test('fromJson creates correct instance', () {
        final json = {
          'add': ['NET_ADMIN', 'SYS_TIME'],
          'drop': ['ALL'],
        };

        final capabilities = Capabilities.fromJson(json);
        expect(capabilities.add, equals(['NET_ADMIN', 'SYS_TIME']));
        expect(capabilities.drop, equals(['ALL']));
      });
    });
  });
}
