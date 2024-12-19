import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/ephemeral_container.dart';
import 'package:kuberneteslib/src/spec/env_var.dart';
import 'package:kuberneteslib/src/spec/env_from_source.dart';
import 'package:kuberneteslib/src/spec/lifecycle.dart';
import 'package:kuberneteslib/src/spec/probe.dart';
import 'package:kuberneteslib/src/spec/config_map_env_source.dart';

void main() {
  group('EphemeralContainer', () {
    test('can be instantiated', () {
      final container = EphemeralContainer();
      expect(container, isNotNull);
    });

    test('supports basic properties', () {
      final container = EphemeralContainer()
        ..name = 'debug'
        ..image = 'busybox:latest'
        ..command = ['sh', '-c']
        ..args = ['echo', 'hello']
        ..imagePullPolicy = 'IfNotPresent';

      expect(container.name, equals('debug'));
      expect(container.image, equals('busybox:latest'));
      expect(container.command, equals(['sh', '-c']));
      expect(container.args, equals(['echo', 'hello']));
      expect(container.imagePullPolicy, equals('IfNotPresent'));
    });

    test('supports environment variables', () {
      final container = EphemeralContainer()
        ..env = [
          EnvVar()
            ..name = 'DEBUG_LEVEL'
            ..value = 'verbose',
          EnvVar()
            ..name = 'TARGET_POD'
            ..value = 'web-server'
        ];

      expect(container.env, hasLength(2));
      expect(container.env?[0].name, equals('DEBUG_LEVEL'));
      expect(container.env?[0].value, equals('verbose'));
      expect(container.env?[1].name, equals('TARGET_POD'));
      expect(container.env?[1].value, equals('web-server'));
    });

    test('supports environment from sources', () {
      final container = EphemeralContainer()
        ..envFrom = [
          EnvFromSource()
            ..configMapRef = (ConfigMapEnvSource()
              ..name = 'debug-config'
              ..optional = true)
            ..prefix = 'DEBUG_'
        ];

      expect(container.envFrom, hasLength(1));
      expect(container.envFrom?[0].configMapRef?.name, equals('debug-config'));
      expect(container.envFrom?[0].configMapRef?.optional, isTrue);
      expect(container.envFrom?[0].prefix, equals('DEBUG_'));
    });

    test('supports lifecycle', () {
      final container = EphemeralContainer()..lifecycle = Lifecycle();

      expect(container.lifecycle, isNotNull);
    });

    test('supports liveness probe', () {
      final container = EphemeralContainer()..livenessProbe = Probe();

      expect(container.livenessProbe, isNotNull);
    });

    test('serializes to JSON with basic properties', () {
      final container = EphemeralContainer()
        ..name = 'debug'
        ..image = 'busybox:latest'
        ..command = ['sh']
        ..args = ['echo', 'hello']
        ..imagePullPolicy = 'IfNotPresent';

      final json = container.toJson();
      expect(json, isA<Map<String, dynamic>>());
      expect(json['name'], equals('debug'));
      expect(json['image'], equals('busybox:latest'));
      expect(json['command'], equals(['sh']));
      expect(json['args'], equals(['echo', 'hello']));
      expect(json['imagePullPolicy'], equals('IfNotPresent'));
    });

    test('serializes to JSON with environment variables', () {
      final container = EphemeralContainer()
        ..env = [
          EnvVar()
            ..name = 'DEBUG_LEVEL'
            ..value = 'verbose'
        ];

      final json = container.toJson();
      expect(json['env'], isNotNull);
      expect(json['env'], hasLength(1));
      expect(json['env'][0]['name'], equals('DEBUG_LEVEL'));
      expect(json['env'][0]['value'], equals('verbose'));
    });

    test('deserializes from JSON with basic properties', () {
      final json = {
        'name': 'debug',
        'image': 'busybox:latest',
        'command': ['sh'],
        'args': ['echo', 'hello'],
        'imagePullPolicy': 'IfNotPresent'
      };

      final container = EphemeralContainer.fromJson(json);
      expect(container.name, equals('debug'));
      expect(container.image, equals('busybox:latest'));
      expect(container.command, equals(['sh']));
      expect(container.args, equals(['echo', 'hello']));
      expect(container.imagePullPolicy, equals('IfNotPresent'));
    });

    test('deserializes from JSON with environment variables', () {
      final json = {
        'env': [
          {'name': 'DEBUG_LEVEL', 'value': 'verbose'}
        ]
      };

      final container = EphemeralContainer.fromJson(json);
      expect(container.env, hasLength(1));
      expect(container.env?[0].name, equals('DEBUG_LEVEL'));
      expect(container.env?[0].value, equals('verbose'));
    });

    test('handles null values in JSON', () {
      final json = {
        'name': null,
        'image': null,
        'command': null,
        'args': null,
        'env': null,
        'envFrom': null,
        'imagePullPolicy': null,
        'lifecycle': null,
        'livenessProbe': null
      };

      final container = EphemeralContainer.fromJson(json);
      expect(container.name, isNull);
      expect(container.image, isNull);
      expect(container.command, isNull);
      expect(container.args, isNull);
      expect(container.env, isNull);
      expect(container.envFrom, isNull);
      expect(container.imagePullPolicy, isNull);
      expect(container.lifecycle, isNull);
      expect(container.livenessProbe, isNull);
    });
  });
}
