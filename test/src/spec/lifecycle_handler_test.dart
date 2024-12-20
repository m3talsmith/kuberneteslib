import 'package:kuberneteslib/src/spec/lifecycle_handler.dart';
import 'package:kuberneteslib/src/spec/exec_action.dart';
import 'package:kuberneteslib/src/spec/http_get_action.dart';
import 'package:kuberneteslib/src/spec/tcp_socket_action.dart';
import 'package:test/test.dart';

void main() {
  group('LifecycleHandler', () {
    test('can be instantiated', () {
      final handler = LifecycleHandler();
      expect(handler, isNotNull);
      expect(handler.exec, isNull);
      expect(handler.httpGet, isNull);
      expect(handler.tcpSocket, isNull);
    });

    test('can be created with exec action', () {
      final handler = LifecycleHandler()
        ..exec = ExecAction()
        ..exec?.command = ['/bin/sh', '-c', 'echo hello'];

      expect(handler.exec, isNotNull);
      expect(handler.exec?.command, equals(['/bin/sh', '-c', 'echo hello']));
      expect(handler.httpGet, isNull);
      expect(handler.tcpSocket, isNull);
    });

    test('can be created with httpGet action', () {
      final handler = LifecycleHandler()
        ..httpGet = HTTPGetAction()
        ..httpGet?.path = '/healthz'
        ..httpGet?.port = 8080;

      expect(handler.httpGet, isNotNull);
      expect(handler.httpGet?.path, equals('/healthz'));
      expect(handler.httpGet?.port, equals(8080));
      expect(handler.exec, isNull);
      expect(handler.tcpSocket, isNull);
    });

    test('can be created with tcpSocket action', () {
      final handler = LifecycleHandler()
        ..tcpSocket = TCPSocketAction()
        ..tcpSocket?.port = 8080;

      expect(handler.tcpSocket, isNotNull);
      expect(handler.tcpSocket?.port, equals(8080));
      expect(handler.exec, isNull);
      expect(handler.httpGet, isNull);
    });

    group('JSON', () {
      test('serializes to JSON with exec action', () {
        final handler = LifecycleHandler()
          ..exec = ExecAction()
          ..exec?.command = ['/bin/sh', '-c', 'echo hello'];

        final json = handler.toJson();
        expect(json, {
          'exec': {
            'command': ['/bin/sh', '-c', 'echo hello']
          }
        });
      });

      test('serializes to JSON with httpGet action', () {
        final handler = LifecycleHandler()
          ..httpGet = HTTPGetAction()
          ..httpGet?.path = '/healthz'
          ..httpGet?.port = 8080;

        final json = handler.toJson();
        expect(json, {
          'httpGet': {'path': '/healthz', 'port': 8080}
        });
      });

      test('serializes to JSON with tcpSocket action', () {
        final handler = LifecycleHandler()
          ..tcpSocket = TCPSocketAction()
          ..tcpSocket?.port = 8080;

        final json = handler.toJson();
        expect(json, {
          'tcpSocket': {'port': 8080}
        });
      });

      test('deserializes from JSON with exec action', () {
        final json = {
          'exec': {
            'command': ['/bin/sh', '-c', 'echo hello']
          }
        };

        final handler = LifecycleHandler.fromJson(json);
        expect(handler.exec, isNotNull);
        expect(handler.exec?.command, equals(['/bin/sh', '-c', 'echo hello']));
        expect(handler.httpGet, isNull);
        expect(handler.tcpSocket, isNull);
      });

      test('deserializes from JSON with httpGet action', () {
        final json = {
          'httpGet': {'path': '/healthz', 'port': 8080}
        };

        final handler = LifecycleHandler.fromJson(json);
        expect(handler.httpGet, isNotNull);
        expect(handler.httpGet?.path, equals('/healthz'));
        expect(handler.httpGet?.port, equals(8080));
        expect(handler.exec, isNull);
        expect(handler.tcpSocket, isNull);
      });

      test('deserializes from JSON with tcpSocket action', () {
        final json = {
          'tcpSocket': {'port': 8080}
        };

        final handler = LifecycleHandler.fromJson(json);
        expect(handler.tcpSocket, isNotNull);
        expect(handler.tcpSocket?.port, equals(8080));
        expect(handler.exec, isNull);
        expect(handler.httpGet, isNull);
      });

      test('handles null values in JSON', () {
        final json = {
          'exec': null,
          'httpGet': null,
          'tcpSocket': null,
        };

        final handler = LifecycleHandler.fromJson(json);
        expect(handler.exec, isNull);
        expect(handler.httpGet, isNull);
        expect(handler.tcpSocket, isNull);
      });
    });
  });
}
