import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/env_from_source.dart';
import 'package:kuberneteslib/src/spec/config_map_env_source.dart';
import 'package:kuberneteslib/src/spec/secret_env_source.dart';

void main() {
  group('EnvFromSource', () {
    test('can be instantiated', () {
      final source = EnvFromSource();
      expect(source, isNotNull);
    });

    test('supports configMapRef', () {
      final source = EnvFromSource()
        ..configMapRef = (ConfigMapEnvSource()
          ..name = 'app-config'
          ..optional = false);

      expect(source.configMapRef, isNotNull);
      expect(source.configMapRef?.name, equals('app-config'));
      expect(source.configMapRef?.optional, isFalse);
    });

    test('supports secretRef', () {
      final source = EnvFromSource()
        ..secretRef = (SecretEnvSource()
          ..name = 'app-secrets'
          ..optional = true);

      expect(source.secretRef, isNotNull);
      expect(source.secretRef?.name, equals('app-secrets'));
      expect(source.secretRef?.optional, isTrue);
    });

    test('supports prefix', () {
      final source = EnvFromSource()..prefix = 'CONFIG_';
      expect(source.prefix, equals('CONFIG_'));
    });

    test('serializes to JSON with configMapRef', () {
      final source = EnvFromSource()
        ..configMapRef = (ConfigMapEnvSource()
          ..name = 'app-config'
          ..optional = false)
        ..prefix = 'CONFIG_';

      final json = source.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['configMapRef'], isNotNull);
      expect(json['configMapRef']['name'], equals('app-config'));
      expect(json['configMapRef']['optional'], isFalse);
      expect(json['prefix'], equals('CONFIG_'));
    });

    test('serializes to JSON with secretRef', () {
      final source = EnvFromSource()
        ..secretRef = (SecretEnvSource()
          ..name = 'app-secrets'
          ..optional = true)
        ..prefix = 'SECRET_';

      final json = source.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['secretRef'], isNotNull);
      expect(json['secretRef']['name'], equals('app-secrets'));
      expect(json['secretRef']['optional'], isTrue);
      expect(json['prefix'], equals('SECRET_'));
    });

    test('deserializes from JSON with configMapRef', () {
      final json = {
        'configMapRef': {'name': 'app-config', 'optional': false},
        'prefix': 'CONFIG_'
      };

      final source = EnvFromSource.fromJson(json);
      expect(source, isA<EnvFromSource>());
      expect(source.configMapRef, isNotNull);
      expect(source.configMapRef?.name, equals('app-config'));
      expect(source.configMapRef?.optional, isFalse);
      expect(source.prefix, equals('CONFIG_'));
    });

    test('deserializes from JSON with secretRef', () {
      final json = {
        'secretRef': {'name': 'app-secrets', 'optional': true},
        'prefix': 'SECRET_'
      };

      final source = EnvFromSource.fromJson(json);
      expect(source, isA<EnvFromSource>());
      expect(source.secretRef, isNotNull);
      expect(source.secretRef?.name, equals('app-secrets'));
      expect(source.secretRef?.optional, isTrue);
      expect(source.prefix, equals('SECRET_'));
    });

    test('handles null values in JSON', () {
      final json = {'configMapRef': null, 'secretRef': null, 'prefix': null};

      final source = EnvFromSource.fromJson(json);
      expect(source.configMapRef, isNull);
      expect(source.secretRef, isNull);
      expect(source.prefix, isNull);
    });
  });
}
