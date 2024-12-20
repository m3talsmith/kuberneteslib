import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/object_field_selector.dart';

void main() {
  group('ObjectFieldSelector', () {
    test('can be instantiated', () {
      final selector = ObjectFieldSelector();
      expect(selector, isNotNull);
    });

    test('can be instantiated with parameters', () {
      final selector = ObjectFieldSelector(
        apiVersion: 'v1',
        fieldPath: 'metadata.name',
      );
      expect(selector.apiVersion, equals('v1'));
      expect(selector.fieldPath, equals('metadata.name'));
    });

    test('can be created from JSON', () {
      final json = {
        'apiVersion': 'v1',
        'fieldPath': 'metadata.namespace',
      };
      final selector = ObjectFieldSelector.fromJson(json);
      expect(selector.apiVersion, equals('v1'));
      expect(selector.fieldPath, equals('metadata.namespace'));
    });

    test('can be converted to JSON', () {
      final selector = ObjectFieldSelector(
        apiVersion: 'v1',
        fieldPath: 'spec.nodeName',
      );
      final json = selector.toJson();
      expect(
          json,
          equals({
            'apiVersion': 'v1',
            'fieldPath': 'spec.nodeName',
          }));
    });

    test('JSON serialization works with null values', () {
      final selector = ObjectFieldSelector();
      final json = selector.toJson();
      expect(json, equals({}));
    });

    test('supports common field paths', () {
      final paths = [
        'metadata.name',
        'metadata.namespace',
        'metadata.uid',
        'spec.nodeName',
        'status.podIP',
      ];

      for (final path in paths) {
        final selector = ObjectFieldSelector(fieldPath: path);
        expect(selector.fieldPath, equals(path));
      }
    });
  });
}
