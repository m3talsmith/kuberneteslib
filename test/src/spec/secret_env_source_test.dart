import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/secret_env_source.dart';

void main() {
  group('SecretEnvSource', () {
    test('can be instantiated', () {
      final secretEnv = SecretEnvSource();
      expect(secretEnv, isNotNull);
    });

    test('supports value equality', () {
      final secretEnv1 = SecretEnvSource()
        ..name = 'test-secret'
        ..optional = true;

      final secretEnv2 = SecretEnvSource()
        ..name = 'test-secret'
        ..optional = true;

      expect(secretEnv1.toJson(), equals(secretEnv2.toJson()));
    });

    group('JSON serialization', () {
      test('toJson() creates correct JSON', () {
        final secretEnv = SecretEnvSource()
          ..name = 'test-secret'
          ..optional = true;

        final json = secretEnv.toJson();
        expect(json, {
          'name': 'test-secret',
          'optional': true,
        });
      });

      test('fromJson() creates correct object', () {
        final json = {
          'name': 'test-secret',
          'optional': true,
        };

        final secretEnv = SecretEnvSource.fromJson(json);
        expect(secretEnv.name, equals('test-secret'));
        expect(secretEnv.optional, isTrue);
      });

      test('toJson() omits null values', () {
        final secretEnv = SecretEnvSource();
        final json = secretEnv.toJson();
        expect(json, isEmpty);
      });

      test('fromJson() handles missing optional values', () {
        final json = {'name': 'test-secret'};
        final secretEnv = SecretEnvSource.fromJson(json);
        expect(secretEnv.name, equals('test-secret'));
        expect(secretEnv.optional, isNull);
      });
    });

    group('field validation', () {
      test('name can be set and retrieved', () {
        final secretEnv = SecretEnvSource()..name = 'my-secret';
        expect(secretEnv.name, equals('my-secret'));
      });

      test('optional can be set and retrieved', () {
        final secretEnv = SecretEnvSource()..optional = true;
        expect(secretEnv.optional, isTrue);
      });
    });
  });
}
