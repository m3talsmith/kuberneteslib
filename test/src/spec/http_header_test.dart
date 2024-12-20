import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/http_header.dart';

void main() {
  group('HTTPHeader', () {
    test('can be instantiated', () {
      final header = HTTPHeader();
      expect(header, isNotNull);
    });

    test('can be created with name and value', () {
      final header = HTTPHeader()
        ..name = 'Content-Type'
        ..value = 'application/json';

      expect(header.name, equals('Content-Type'));
      expect(header.value, equals('application/json'));
    });

    group('JSON serialization', () {
      test('can be serialized to JSON', () {
        final header = HTTPHeader()
          ..name = 'Authorization'
          ..value = 'Bearer token123';

        final json = header.toJson();
        expect(json, {
          'name': 'Authorization',
          'value': 'Bearer token123',
        });
      });

      test('can be deserialized from JSON', () {
        final json = {
          'name': 'Accept',
          'value': 'text/plain',
        };

        final header = HTTPHeader.fromJson(json);
        expect(header.name, equals('Accept'));
        expect(header.value, equals('text/plain'));
      });

      test('json serialization is symmetric', () {
        final header = HTTPHeader()
          ..name = 'X-Custom-Header'
          ..value = 'custom-value';

        final deserializedHeader = HTTPHeader.fromJson(header.toJson());
        expect(deserializedHeader.name, equals(header.name));
        expect(deserializedHeader.value, equals(header.value));
      });
    });
  });
}
