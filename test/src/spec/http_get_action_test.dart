import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/http_get_action.dart';
import 'package:kuberneteslib/src/spec/http_header.dart';

void main() {
  group('HTTPGetAction', () {
    test('can be instantiated', () {
      final action = HTTPGetAction();
      expect(action, isNotNull);
    });

    test('supports all properties in constructor', () {
      final action = HTTPGetAction(
        host: 'example.com',
        path: '/health',
        port: 8080,
        scheme: 'HTTPS',
        httpHeaders: [
          HTTPHeader()
            ..name = 'Accept'
            ..value = 'application/json'
        ],
      );

      expect(action.host, equals('example.com'));
      expect(action.path, equals('/health'));
      expect(action.port, equals(8080));
      expect(action.scheme, equals('HTTPS'));
      expect(action.httpHeaders, hasLength(1));
      expect(action.httpHeaders?[0].name, equals('Accept'));
      expect(action.httpHeaders?[0].value, equals('application/json'));
    });

    test('can serialize to JSON', () {
      final action = HTTPGetAction()
        ..host = 'example.com'
        ..path = '/health'
        ..port = 8080
        ..scheme = 'HTTPS'
        ..httpHeaders = [
          HTTPHeader()
            ..name = 'Accept'
            ..value = 'application/json',
          HTTPHeader()
            ..name = 'Authorization'
            ..value = 'Bearer token'
        ];

      final json = action.toJson();

      expect(json['host'], equals('example.com'));
      expect(json['path'], equals('/health'));
      expect(json['port'], equals(8080));
      expect(json['scheme'], equals('HTTPS'));
      expect(json['httpHeaders'], hasLength(2));
      expect(json['httpHeaders'][0]['name'], equals('Accept'));
      expect(json['httpHeaders'][0]['value'], equals('application/json'));
      expect(json['httpHeaders'][1]['name'], equals('Authorization'));
      expect(json['httpHeaders'][1]['value'], equals('Bearer token'));
    });

    test('can deserialize from JSON', () {
      final json = {
        'host': 'example.com',
        'path': '/health',
        'port': 8080,
        'scheme': 'HTTPS',
        'httpHeaders': [
          {'name': 'Accept', 'value': 'application/json'},
          {'name': 'Authorization', 'value': 'Bearer token'}
        ]
      };

      final action = HTTPGetAction.fromJson(json);

      expect(action.host, equals('example.com'));
      expect(action.path, equals('/health'));
      expect(action.port, equals(8080));
      expect(action.scheme, equals('HTTPS'));
      expect(action.httpHeaders, hasLength(2));
      expect(action.httpHeaders?[0].name, equals('Accept'));
      expect(action.httpHeaders?[0].value, equals('application/json'));
      expect(action.httpHeaders?[1].name, equals('Authorization'));
      expect(action.httpHeaders?[1].value, equals('Bearer token'));
    });

    test('handles null values', () {
      final action = HTTPGetAction();
      expect(action.host, isNull);
      expect(action.path, isNull);
      expect(action.port, isNull);
      expect(action.scheme, isNull);
      expect(action.httpHeaders, isNull);

      final json = action.toJson();
      expect(json, isEmpty);
    });

    test('supports string port name', () {
      final action = HTTPGetAction()
        ..port = 'http'
        ..path = '/health';

      final json = action.toJson();
      expect(json['port'], equals('http'));

      final deserialized = HTTPGetAction.fromJson(json);
      expect(deserialized.port, equals('http'));
    });

    test('supports numeric port', () {
      final action = HTTPGetAction()
        ..port = 8080
        ..path = '/health';

      final json = action.toJson();
      expect(json['port'], equals(8080));

      final deserialized = HTTPGetAction.fromJson(json);
      expect(deserialized.port, equals(8080));
    });
  });
}
