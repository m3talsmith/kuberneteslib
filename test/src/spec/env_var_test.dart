import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/env_var.dart';
import 'package:kuberneteslib/src/spec/env_var_source.dart';
import 'package:kuberneteslib/src/spec/config_map_key_selector.dart';
import 'package:kuberneteslib/src/spec/secret_key_selector.dart';
import 'package:kuberneteslib/src/spec/object_field_selector.dart';
import 'package:kuberneteslib/src/spec/resource_field_selector.dart';

void main() {
  group('EnvVar', () {
    test('can be instantiated', () {
      final envVar = EnvVar();
      expect(envVar, isNotNull);
    });

    test('supports direct value', () {
      final envVar = EnvVar()
        ..name = 'DATABASE_HOST'
        ..value = 'postgres.default.svc.cluster.local';

      expect(envVar.name, equals('DATABASE_HOST'));
      expect(envVar.value, equals('postgres.default.svc.cluster.local'));
      expect(envVar.valueFrom, isNull);
    });

    test('supports ConfigMap reference', () {
      final envVar = EnvVar()
        ..name = 'API_KEY'
        ..valueFrom = (EnvVarSource()
          ..configMapKeyRef = (ConfigMapKeySelector()
            ..name = 'api-config'
            ..key = 'api-key'
            ..optional = false));

      expect(envVar.name, equals('API_KEY'));
      expect(envVar.value, isNull);
      expect(envVar.valueFrom?.configMapKeyRef, isNotNull);
      expect(envVar.valueFrom?.configMapKeyRef?.name, equals('api-config'));
      expect(envVar.valueFrom?.configMapKeyRef?.key, equals('api-key'));
      expect(envVar.valueFrom?.configMapKeyRef?.optional, isFalse);
    });

    test('supports Secret reference', () {
      final envVar = EnvVar()
        ..name = 'DB_PASSWORD'
        ..valueFrom = (EnvVarSource()
          ..secretKeyRef = (SecretKeySelector()
            ..name = 'db-credentials'
            ..key = 'password'
            ..optional = true));

      expect(envVar.name, equals('DB_PASSWORD'));
      expect(envVar.value, isNull);
      expect(envVar.valueFrom?.secretKeyRef, isNotNull);
      expect(envVar.valueFrom?.secretKeyRef?.name, equals('db-credentials'));
      expect(envVar.valueFrom?.secretKeyRef?.key, equals('password'));
      expect(envVar.valueFrom?.secretKeyRef?.optional, isTrue);
    });

    test('supports Field reference', () {
      final envVar = EnvVar()
        ..name = 'POD_NAME'
        ..valueFrom = (EnvVarSource()
          ..fieldRef = (ObjectFieldSelector()
            ..fieldPath = 'metadata.name'
            ..apiVersion = 'v1'));

      expect(envVar.name, equals('POD_NAME'));
      expect(envVar.value, isNull);
      expect(envVar.valueFrom?.fieldRef, isNotNull);
      expect(envVar.valueFrom?.fieldRef?.fieldPath, equals('metadata.name'));
      expect(envVar.valueFrom?.fieldRef?.apiVersion, equals('v1'));
    });

    test('supports Resource reference', () {
      final envVar = EnvVar()
        ..name = 'CPU_LIMIT'
        ..valueFrom = (EnvVarSource()
          ..resourceFieldRef = (ResourceFieldSelector()
            ..containerName = 'web'
            ..resource = 'limits.cpu'
            ..divisor = '1m'));

      expect(envVar.name, equals('CPU_LIMIT'));
      expect(envVar.value, isNull);
      expect(envVar.valueFrom?.resourceFieldRef, isNotNull);
      expect(envVar.valueFrom?.resourceFieldRef?.containerName, equals('web'));
      expect(
          envVar.valueFrom?.resourceFieldRef?.resource, equals('limits.cpu'));
      expect(envVar.valueFrom?.resourceFieldRef?.divisor, equals('1m'));
    });

    test('serializes to JSON with direct value', () {
      final envVar = EnvVar()
        ..name = 'DATABASE_HOST'
        ..value = 'postgres.default.svc.cluster.local';

      final json = envVar.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['name'], equals('DATABASE_HOST'));
      expect(json['value'], equals('postgres.default.svc.cluster.local'));
      expect(json['valueFrom'], isNull);
    });

    test('serializes to JSON with ConfigMap reference', () {
      final envVar = EnvVar()
        ..name = 'API_KEY'
        ..valueFrom = (EnvVarSource()
          ..configMapKeyRef = (ConfigMapKeySelector()
            ..name = 'api-config'
            ..key = 'api-key'
            ..optional = false));

      final json = envVar.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['name'], equals('API_KEY'));
      expect(json['value'], isNull);
      expect(json['valueFrom']['configMapKeyRef'], isNotNull);
      expect(
          json['valueFrom']['configMapKeyRef']['name'], equals('api-config'));
      expect(json['valueFrom']['configMapKeyRef']['key'], equals('api-key'));
      expect(json['valueFrom']['configMapKeyRef']['optional'], isFalse);
    });

    test('deserializes from JSON with direct value', () {
      final json = {
        'name': 'DATABASE_HOST',
        'value': 'postgres.default.svc.cluster.local'
      };

      final envVar = EnvVar.fromJson(json);
      expect(envVar, isA<EnvVar>());
      expect(envVar.name, equals('DATABASE_HOST'));
      expect(envVar.value, equals('postgres.default.svc.cluster.local'));
      expect(envVar.valueFrom, isNull);
    });

    test('deserializes from JSON with ConfigMap reference', () {
      final json = {
        'name': 'API_KEY',
        'valueFrom': {
          'configMapKeyRef': {
            'name': 'api-config',
            'key': 'api-key',
            'optional': false
          }
        }
      };

      final envVar = EnvVar.fromJson(json);
      expect(envVar, isA<EnvVar>());
      expect(envVar.name, equals('API_KEY'));
      expect(envVar.value, isNull);
      expect(envVar.valueFrom?.configMapKeyRef, isNotNull);
      expect(envVar.valueFrom?.configMapKeyRef?.name, equals('api-config'));
      expect(envVar.valueFrom?.configMapKeyRef?.key, equals('api-key'));
      expect(envVar.valueFrom?.configMapKeyRef?.optional, isFalse);
    });

    test('handles null values in JSON', () {
      final json = {'name': null, 'value': null, 'valueFrom': null};

      final envVar = EnvVar.fromJson(json);
      expect(envVar.name, isNull);
      expect(envVar.value, isNull);
      expect(envVar.valueFrom, isNull);
    });
  });
}
