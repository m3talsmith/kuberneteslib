import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/env_var_source.dart';
import 'package:kuberneteslib/src/spec/config_map_key_selector.dart';
import 'package:kuberneteslib/src/spec/object_field_selector.dart';
import 'package:kuberneteslib/src/spec/resource_field_selector.dart';
import 'package:kuberneteslib/src/spec/secret_key_selector.dart';

void main() {
  group('EnvVarSource', () {
    test('can be instantiated', () {
      final source = EnvVarSource();
      expect(source, isNotNull);
    });

    test('supports configMapKeyRef', () {
      final source = EnvVarSource()
        ..configMapKeyRef = (ConfigMapKeySelector()
          ..name = 'app-config'
          ..key = 'database-url'
          ..optional = false);

      expect(source.configMapKeyRef, isNotNull);
      expect(source.configMapKeyRef?.name, equals('app-config'));
      expect(source.configMapKeyRef?.key, equals('database-url'));
      expect(source.configMapKeyRef?.optional, isFalse);
    });

    test('supports fieldRef', () {
      final source = EnvVarSource()
        ..fieldRef = (ObjectFieldSelector()
          ..fieldPath = 'metadata.name'
          ..apiVersion = 'v1');

      expect(source.fieldRef, isNotNull);
      expect(source.fieldRef?.fieldPath, equals('metadata.name'));
      expect(source.fieldRef?.apiVersion, equals('v1'));
    });

    test('supports resourceFieldRef', () {
      final source = EnvVarSource()
        ..resourceFieldRef = (ResourceFieldSelector()
          ..containerName = 'web'
          ..resource = 'limits.cpu'
          ..divisor = '1m');

      expect(source.resourceFieldRef, isNotNull);
      expect(source.resourceFieldRef?.containerName, equals('web'));
      expect(source.resourceFieldRef?.resource, equals('limits.cpu'));
      expect(source.resourceFieldRef?.divisor, equals('1m'));
    });

    test('supports secretKeyRef', () {
      final source = EnvVarSource()
        ..secretKeyRef = (SecretKeySelector()
          ..name = 'app-secrets'
          ..key = 'api-key'
          ..optional = true);

      expect(source.secretKeyRef, isNotNull);
      expect(source.secretKeyRef?.name, equals('app-secrets'));
      expect(source.secretKeyRef?.key, equals('api-key'));
      expect(source.secretKeyRef?.optional, isTrue);
    });

    test('serializes to JSON with configMapKeyRef', () {
      final source = EnvVarSource()
        ..configMapKeyRef = (ConfigMapKeySelector()
          ..name = 'app-config'
          ..key = 'database-url'
          ..optional = false);

      final json = source.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['configMapKeyRef'], isNotNull);
      expect(json['configMapKeyRef']['name'], equals('app-config'));
      expect(json['configMapKeyRef']['key'], equals('database-url'));
      expect(json['configMapKeyRef']['optional'], isFalse);
    });

    test('serializes to JSON with fieldRef', () {
      final source = EnvVarSource()
        ..fieldRef = (ObjectFieldSelector()
          ..fieldPath = 'metadata.name'
          ..apiVersion = 'v1');

      final json = source.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['fieldRef'], isNotNull);
      expect(json['fieldRef']['fieldPath'], equals('metadata.name'));
      expect(json['fieldRef']['apiVersion'], equals('v1'));
    });

    test('serializes to JSON with resourceFieldRef', () {
      final source = EnvVarSource()
        ..resourceFieldRef = (ResourceFieldSelector()
          ..containerName = 'web'
          ..resource = 'limits.cpu'
          ..divisor = '1m');

      final json = source.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['resourceFieldRef'], isNotNull);
      expect(json['resourceFieldRef']['containerName'], equals('web'));
      expect(json['resourceFieldRef']['resource'], equals('limits.cpu'));
      expect(json['resourceFieldRef']['divisor'], equals('1m'));
    });

    test('serializes to JSON with secretKeyRef', () {
      final source = EnvVarSource()
        ..secretKeyRef = (SecretKeySelector()
          ..name = 'app-secrets'
          ..key = 'api-key'
          ..optional = true);

      final json = source.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['secretKeyRef'], isNotNull);
      expect(json['secretKeyRef']['name'], equals('app-secrets'));
      expect(json['secretKeyRef']['key'], equals('api-key'));
      expect(json['secretKeyRef']['optional'], isTrue);
    });

    test('deserializes from JSON with configMapKeyRef', () {
      final json = {
        'configMapKeyRef': {
          'name': 'app-config',
          'key': 'database-url',
          'optional': false
        }
      };

      final source = EnvVarSource.fromJson(json);
      expect(source, isA<EnvVarSource>());
      expect(source.configMapKeyRef, isNotNull);
      expect(source.configMapKeyRef?.name, equals('app-config'));
      expect(source.configMapKeyRef?.key, equals('database-url'));
      expect(source.configMapKeyRef?.optional, isFalse);
    });

    test('deserializes from JSON with fieldRef', () {
      final json = {
        'fieldRef': {'fieldPath': 'metadata.name', 'apiVersion': 'v1'}
      };

      final source = EnvVarSource.fromJson(json);
      expect(source, isA<EnvVarSource>());
      expect(source.fieldRef, isNotNull);
      expect(source.fieldRef?.fieldPath, equals('metadata.name'));
      expect(source.fieldRef?.apiVersion, equals('v1'));
    });

    test('deserializes from JSON with resourceFieldRef', () {
      final json = {
        'resourceFieldRef': {
          'containerName': 'web',
          'resource': 'limits.cpu',
          'divisor': '1m'
        }
      };

      final source = EnvVarSource.fromJson(json);
      expect(source, isA<EnvVarSource>());
      expect(source.resourceFieldRef, isNotNull);
      expect(source.resourceFieldRef?.containerName, equals('web'));
      expect(source.resourceFieldRef?.resource, equals('limits.cpu'));
      expect(source.resourceFieldRef?.divisor, equals('1m'));
    });

    test('deserializes from JSON with secretKeyRef', () {
      final json = {
        'secretKeyRef': {
          'name': 'app-secrets',
          'key': 'api-key',
          'optional': true
        }
      };

      final source = EnvVarSource.fromJson(json);
      expect(source, isA<EnvVarSource>());
      expect(source.secretKeyRef, isNotNull);
      expect(source.secretKeyRef?.name, equals('app-secrets'));
      expect(source.secretKeyRef?.key, equals('api-key'));
      expect(source.secretKeyRef?.optional, isTrue);
    });

    test('handles null values in JSON', () {
      final json = {
        'configMapKeyRef': null,
        'fieldRef': null,
        'resourceFieldRef': null,
        'secretKeyRef': null
      };

      final source = EnvVarSource.fromJson(json);
      expect(source.configMapKeyRef, isNull);
      expect(source.fieldRef, isNull);
      expect(source.resourceFieldRef, isNull);
      expect(source.secretKeyRef, isNull);
    });
  });
}
