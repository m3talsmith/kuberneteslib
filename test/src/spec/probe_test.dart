import 'package:kuberneteslib/src/spec/probe.dart';
import 'package:kuberneteslib/src/spec/exec_action.dart';
import 'package:kuberneteslib/src/spec/grpc_action.dart';
import 'package:kuberneteslib/src/spec/http_get_action.dart';
import 'package:kuberneteslib/src/spec/tcp_socket_action.dart';
import 'package:test/test.dart';

void main() {
  group('Probe', () {
    test('can be instantiated', () {
      expect(Probe(), isNotNull);
    });

    test('supports JSON serialization', () {
      final probe = Probe()
        ..exec = (ExecAction()..command = ['test', 'command'])
        ..failureThreshold = 3
        ..initialDelaySeconds = 10
        ..periodSeconds = 5
        ..successThreshold = 1
        ..timeoutSeconds = 2
        ..terminationGracePeriodSeconds = 30;

      final json = probe.toJson();
      final deserialized = Probe.fromJson(json);

      expect(deserialized.exec?.command, equals(['test', 'command']));
      expect(deserialized.failureThreshold, equals(3));
      expect(deserialized.initialDelaySeconds, equals(10));
      expect(deserialized.periodSeconds, equals(5));
      expect(deserialized.successThreshold, equals(1));
      expect(deserialized.timeoutSeconds, equals(2));
      expect(deserialized.terminationGracePeriodSeconds, equals(30));
    });

    test('supports HTTP GET probe configuration', () {
      final probe = Probe()
        ..httpGet = (HTTPGetAction()
          ..path = '/health'
          ..port = 8080)
        ..initialDelaySeconds = 5;

      final json = probe.toJson();
      expect(json['httpGet'], isNotNull);
      expect(json['httpGet']['path'], equals('/health'));
      expect(json['httpGet']['port'], equals(8080));
      expect(json['initialDelaySeconds'], equals(5));
    });

    test('supports TCP socket probe configuration', () {
      final probe = Probe()
        ..tcpSocket = (TCPSocketAction()..port = 3306)
        ..periodSeconds = 10;

      final json = probe.toJson();
      expect(json['tcpSocket'], isNotNull);
      expect(json['tcpSocket']['port'], equals(3306));
      expect(json['periodSeconds'], equals(10));
    });

    test('supports gRPC probe configuration', () {
      final probe = Probe()
        ..grpc = (GRPCAction()
          ..port = 50051
          ..service = 'health.check')
        ..timeoutSeconds = 3;

      final json = probe.toJson();
      expect(json['grpc'], isNotNull);
      expect(json['grpc']['port'], equals(50051));
      expect(json['grpc']['service'], equals('health.check'));
      expect(json['timeoutSeconds'], equals(3));
    });

    test('excludes null values from JSON', () {
      final probe = Probe()..httpGet = (HTTPGetAction()..port = 8080);

      final json = probe.toJson();
      expect(json.containsKey('exec'), isFalse);
      expect(json.containsKey('failureThreshold'), isFalse);
      expect(json.containsKey('grpc'), isFalse);
      expect(json.containsKey('tcpSocket'), isFalse);
      expect(json.containsKey('initialDelaySeconds'), isFalse);
      expect(json.containsKey('terminationGracePeriodSeconds'), isFalse);
    });

    test('deserializes from JSON with minimal fields', () {
      final json = {
        'httpGet': {
          'port': 8080,
        },
      };

      final probe = Probe.fromJson(json);
      expect(probe.httpGet, isNotNull);
      expect(probe.httpGet?.port, equals(8080));
      expect(probe.failureThreshold, isNull);
      expect(probe.initialDelaySeconds, isNull);
      expect(probe.timeoutSeconds, isNull);
    });
  });
}
