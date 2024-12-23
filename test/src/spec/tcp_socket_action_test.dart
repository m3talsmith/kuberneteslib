import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/tcp_socket_action.dart';

void main() {
  group('TCPSocketAction', () {
    test('can be instantiated', () {
      final action = TCPSocketAction();
      expect(action, isNotNull);
    });

    test('can be instantiated with parameters', () {
      final action = TCPSocketAction(
        host: 'localhost',
        port: 8080,
      );
      expect(action.host, equals('localhost'));
      expect(action.port, equals(8080));
    });

    group('JSON serialization', () {
      test('toJson() creates correct JSON with all fields', () {
        final action = TCPSocketAction()
          ..host = 'mysql-service'
          ..port = 3306;

        final json = action.toJson();
        expect(json, {
          'host': 'mysql-service',
          'port': 3306,
        });
      });

      test('toJson() omits null values', () {
        final action = TCPSocketAction()..port = 8080;

        final json = action.toJson();
        expect(json, {
          'port': 8080,
        });
        expect(json.containsKey('host'), isFalse);
      });

      test('fromJson() creates correct instance', () {
        final json = {
          'host': 'redis-service',
          'port': 6379,
        };

        final action = TCPSocketAction.fromJson(json);
        expect(action.host, equals('redis-service'));
        expect(action.port, equals(6379));
      });

      test('fromJson() handles string port values', () {
        final json = {
          'host': 'web-service',
          'port': 'http',
        };

        final action = TCPSocketAction.fromJson(json);
        expect(action.host, equals('web-service'));
        expect(action.port, equals('http'));
      });

      test('fromJson() handles missing optional fields', () {
        final json = {
          'port': 8080,
        };

        final action = TCPSocketAction.fromJson(json);
        expect(action.host, isNull);
        expect(action.port, equals(8080));
      });
    });
  });
}
