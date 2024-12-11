import 'package:test/test.dart';
import 'package:kuberneteslib/src/cluster/exec.dart';

void main() {
  group('Exec', () {
    test('creates instance with default values', () {
      final exec = Exec();
      
      expect(exec.command, equals('doctl'));
      expect(exec.apiVersion, equals('client.authentication.k8s.io/v1beta1'));
      expect(exec.interactiveMode, equals('IfAvailable'));
      expect(exec.provideClusterInfo, equals(false));
      expect(exec.arguments, isNull);
      expect(exec.env, isNull);
    });

    test('creates instance with custom values', () {
      final exec = Exec(
        command: 'aws',
        arguments: ['eks', 'get-token', '--cluster-name', 'my-cluster'],
        apiVersion: 'client.authentication.k8s.io/v1',
        env: 'AWS_PROFILE=default',
        interactiveMode: 'Never',
        provideClusterInfo: true,
      );

      expect(exec.command, equals('aws'));
      expect(exec.arguments, equals(['eks', 'get-token', '--cluster-name', 'my-cluster']));
      expect(exec.apiVersion, equals('client.authentication.k8s.io/v1'));
      expect(exec.env, equals('AWS_PROFILE=default'));
      expect(exec.interactiveMode, equals('Never'));
      expect(exec.provideClusterInfo, equals(true));
    });

    test('serializes to JSON correctly', () {
      final exec = Exec(
        command: 'gcloud',
        arguments: ['container', 'clusters', 'get-credentials'],
      );

      final json = exec.toJson();
      
      expect(json['command'], equals('gcloud'));
      expect(json['arguments'], equals(['container', 'clusters', 'get-credentials']));
      expect(json['apiVersion'], equals('client.authentication.k8s.io/v1beta1'));
      expect(json['interactiveMode'], equals('IfAvailable'));
      expect(json['provideClusterInfo'], equals(false));
    });

    test('deserializes from JSON correctly', () {
      final json = {
        'command': 'aws',
        'arguments': ['eks', 'get-token'],
        'apiVersion': 'client.authentication.k8s.io/v1',
        'interactiveMode': 'Never',
      };

      final exec = Exec.fromJson(json);

      expect(exec.command, equals('aws'));
      expect(exec.arguments, equals(['eks', 'get-token']));
      expect(exec.apiVersion, equals('client.authentication.k8s.io/v1'));
      expect(exec.interactiveMode, equals('Never'));
    });
  });

  group('ExecResult', () {
    test('creates instance and serializes correctly', () {
      final result = ExecResult(
        kind: 'ExecCredential',
        apiVersion: 'client.authentication.k8s.io/v1beta1',
        spec: ExecSpec(interactive: false),
        status: ExecStatus(token: 'abc123'),
      );

      expect(result.kind, equals('ExecCredential'));
      expect(result.apiVersion, equals('client.authentication.k8s.io/v1beta1'));
      expect(result.spec.interactive, equals(false));
      expect(result.status.token, equals('abc123'));

      final json = result.toJson();
      expect(json['kind'], equals('ExecCredential'));
      expect(json['status']['token'], equals('abc123'));
    });
  });

  group('ExecStatus', () {
    test('handles expiration timestamp correctly', () {
      final timestamp = DateTime.utc(2024, 1, 1, 12, 0);
      final status = ExecStatus(
        token: 'xyz789',
        expirationTimestamp: timestamp,
      );

      final json = status.toJson();
      final decoded = ExecStatus.fromJson(json);

      expect(decoded.token, equals('xyz789'));
      expect(decoded.expirationTimestamp?.toUtc(), equals(timestamp));
    });
  });
} 