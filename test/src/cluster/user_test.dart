import 'package:test/test.dart';
import 'package:kuberneteslib/src/cluster/user.dart';
import 'package:kuberneteslib/src/cluster/exec.dart';

void main() {
  group('User', () {
    test('creates instance with certificate authentication', () {
      final user = User(
        name: 'cert-user',
        clientCertificateData: 'test-certificate',
        clientKeyData: 'test-key',
      );

      expect(user.name, equals('cert-user'));
      expect(user.clientCertificateData, equals('test-certificate'));
      expect(user.clientKeyData, equals('test-key'));
      expect(user.exec, isNull);
    });

    test('creates instance with exec authentication', () {
      final exec = Exec(
        command: 'aws',
        arguments: ['eks', 'get-token', '--cluster-name', 'test-cluster'],
      );

      final user = User(
        name: 'exec-user',
        exec: exec,
      );

      expect(user.name, equals('exec-user'));
      expect(user.clientCertificateData, isNull);
      expect(user.clientKeyData, isNull);
      expect(user.exec, equals(exec));
    });

    group('JSON serialization', () {
      test('serializes to JSON with certificate auth', () {
        final user = User(
          name: 'cert-user',
          clientCertificateData: 'test-certificate',
          clientKeyData: 'test-key',
        );

        final json = user.toJson();

        expect(
            json,
            equals({
              'name': 'cert-user',
              'user': {
                'client-certificate-data': 'test-certificate',
                'client-key-data': 'test-key',
              },
            }));
      });

      test('serializes to JSON with exec auth', () {
        final user = User(
          name: 'exec-user',
          exec: Exec(
            command: 'aws',
            arguments: ['eks', 'get-token', '--cluster-name', 'test-cluster'],
          ),
        );

        final json = user.toJson();

        expect(json['name'], equals('exec-user'));
        expect(json['user']['exec']['command'], equals('aws'));
        expect(json['user']['exec']['arguments'],
            equals(['eks', 'get-token', '--cluster-name', 'test-cluster']));
      });

      test('deserializes from JSON with certificate auth', () {
        final json = {
          'name': 'cert-user',
          'user': {
            'client-certificate-data': 'test-certificate',
            'client-key-data': 'test-key',
          },
        };

        final user = User.fromJson(json);

        expect(user.name, equals('cert-user'));
        expect(user.clientCertificateData, equals('test-certificate'));
        expect(user.clientKeyData, equals('test-key'));
        expect(user.exec, isNull);
      });

      test('deserializes from JSON with exec auth', () {
        final json = {
          'name': 'exec-user',
          'user': {
            'exec': {
              'command': 'aws',
              'arguments': [
                'eks',
                'get-token',
                '--cluster-name',
                'test-cluster'
              ],
            },
          },
        };

        final user = User.fromJson(json);

        expect(user.name, equals('exec-user'));
        expect(user.clientCertificateData, isNull);
        expect(user.clientKeyData, isNull);
        expect(user.exec?.command, equals('aws'));
        expect(user.exec?.arguments,
            equals(['eks', 'get-token', '--cluster-name', 'test-cluster']));
      });
    });
  });
}
