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
      test('toJson() creates correct JSON', () {
        final action = TCPSocketAction(
          host: 'example.com',
          port: 443,
        );

        final json = action.toJson();
        expect(json, {
          'host': 'example.com',
          'port': 443,
        });
      });

      test('fromJson() creates correct object', () {
        final json = {
          'host': 'test-host',
          'port': 80,
        };

        final action = TCPSocketAction.fromJson(json);
        expect(action.host, equals('test-host'));
        expect(action.port, equals(80));
      });

      test('handles string port values', () {
        final action = TCPSocketAction(
          host: 'localhost',
          port: 'http',
        );

        final json = action.toJson();
        expect(json['port'], equals('http'));

        final decoded = TCPSocketAction.fromJson(json);
        expect(decoded.port, equals('http'));
      });

      test('excludes null port from JSON', () {
        final action = TCPSocketAction(
          host: 'localhost',
        );

        final json = action.toJson();
        expect(json.containsKey('port'), isFalse);
      });

      test('handles empty values', () {
        final action = TCPSocketAction();
        final json = action.toJson();

        expect(json, {});

        final decoded = TCPSocketAction.fromJson(json);
        expect(decoded.host, isNull);
        expect(decoded.port, isNull);
      });
    });
  });
}
