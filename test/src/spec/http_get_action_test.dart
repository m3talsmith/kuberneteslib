import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/http_get_action.dart';
import 'package:kuberneteslib/src/spec/http_header.dart';

void main() {
  group('HTTPGetAction', () {
    test('can be instantiated', () {
      final action = HTTPGetAction();
      expect(action, isNotNull);
    });

    test('can be created with all properties', () {
      final action = HTTPGetAction(
        host: 'example.com',
        path: '/health',
        port: 8080,
        scheme: 'HTTPS',
        httpHeaders: [
          HTTPHeader()
            ..name = 'Custom-Header'
            ..value = 'test-value'
        ],
      );

      expect(action.host, equals('example.com'));
      expect(action.path, equals('/health'));
      expect(action.port, equals(8080));
      expect(action.scheme, equals('HTTPS'));
      expect(action.httpHeaders, hasLength(1));
      expect(action.httpHeaders!.first.name, equals('Custom-Header'));
      expect(action.httpHeaders!.first.value, equals('test-value'));
    });

    test('supports named port', () {
      final action = HTTPGetAction()..port = 'http';
      expect(action.port, equals('http'));
    });

    group('JSON serialization', () {
      test('toJson() includes only non-null values', () {
        final action = HTTPGetAction()
          ..path = '/health'
          ..port = 8080;

        final json = action.toJson();
        expect(json, {
          'path': '/health',
          'port': 8080,
        });
      });

      test('fromJson() deserializes correctly', () {
        final json = {
          'host': 'example.com',
          'path': '/health',
          'port': 8080,
          'scheme': 'HTTPS',
          'httpHeaders': [
            {
              'name': 'Custom-Header',
              'value': 'test-value',
            }
          ],
        };

        final action = HTTPGetAction.fromJson(json);
        expect(action.host, equals('example.com'));
        expect(action.path, equals('/health'));
        expect(action.port, equals(8080));
        expect(action.scheme, equals('HTTPS'));
        expect(action.httpHeaders, hasLength(1));
        expect(action.httpHeaders!.first.name, equals('Custom-Header'));
        expect(action.httpHeaders!.first.value, equals('test-value'));
      });

      test('handles empty httpHeaders', () {
        final action = HTTPGetAction();
        final json = action.toJson();
        expect(json, isEmpty);

        final deserializedAction = HTTPGetAction.fromJson(json);
        expect(deserializedAction.httpHeaders, isNull);
      });
    });
  });
}
