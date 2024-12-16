import 'package:test/test.dart';
import 'package:kuberneteslib/src/cluster/exec.dart';

void main() {
  group('Exec', () {
    test('creates instance with default values', () {
      final exec = Exec();

      expect(exec.command, equals('doctl'));
      expect(exec.arguments, isNull);
      expect(exec.apiVersion, equals('client.authentication.k8s.io/v1beta1'));
      expect(exec.interactiveMode, equals('IfAvailable'));
      expect(exec.provideClusterInfo, isFalse);
    });

    test('creates instance with custom values', () {
      final exec = Exec(
        command: 'aws',
        arguments: ['eks', 'get-token', '--cluster-name', 'test-cluster'],
        apiVersion: 'v2',
        env: 'AWS_PROFILE=default',
        interactiveMode: 'Never',
        provideClusterInfo: true,
      );

      expect(exec.command, equals('aws'));
      expect(exec.arguments,
          equals(['eks', 'get-token', '--cluster-name', 'test-cluster']));
      expect(exec.apiVersion, equals('v2'));
      expect(exec.env, equals('AWS_PROFILE=default'));
      expect(exec.interactiveMode, equals('Never'));
      expect(exec.provideClusterInfo, isTrue);
    });

    group('JSON serialization', () {
      test('serializes to JSON with all fields', () {
        final exec = Exec(
          command: 'aws',
          arguments: ['eks', 'get-token', '--cluster-name', 'test-cluster'],
          apiVersion: 'v2',
          env: 'AWS_PROFILE=default',
          interactiveMode: 'Never',
          provideClusterInfo: true,
        );

        final json = exec.toJson();

        expect(json['command'], equals('aws'));
        expect(json['arguments'],
            equals(['eks', 'get-token', '--cluster-name', 'test-cluster']));
        expect(json['apiVersion'], equals('v2'));
        expect(json['env'], equals('AWS_PROFILE=default'));
        expect(json['interactiveMode'], equals('Never'));
        expect(json['provideClusterInfo'], isTrue);
      });

      test('deserializes from JSON', () {
        final json = {
          'command': 'aws',
          'arguments': ['eks', 'get-token', '--cluster-name', 'test-cluster'],
          'apiVersion': 'v2',
          'env': 'AWS_PROFILE=default',
          'interactiveMode': 'Never',
          'provideClusterInfo': true,
        };

        final exec = Exec.fromJson(json);

        expect(exec.command, equals('aws'));
        expect(exec.arguments,
            equals(['eks', 'get-token', '--cluster-name', 'test-cluster']));
        expect(exec.apiVersion, equals('v2'));
        expect(exec.env, equals('AWS_PROFILE=default'));
        expect(exec.interactiveMode, equals('Never'));
        expect(exec.provideClusterInfo, isTrue);
      });
    });
  });

  group('ExecResult', () {
    test('creates instance and serializes correctly', () {
      final result = ExecResult(
        kind: 'ExecCredential',
        apiVersion: 'client.authentication.k8s.io/v1beta1',
        spec: ExecSpec(interactive: false),
        status: ExecStatus(token: 'test-token'),
      );

      final json = result.toJson();

      expect(json['kind'], equals('ExecCredential'));
      expect(
          json['apiVersion'], equals('client.authentication.k8s.io/v1beta1'));
      expect(json['spec']['interactive'], isFalse);
      expect(json['status']['token'], equals('test-token'));
    });
  });
}
