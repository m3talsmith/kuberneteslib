import 'package:kuberneteslib/src/spec/resource_field_selector.dart';
import 'package:test/test.dart';

void main() {
  group('ResourceFieldSelector', () {
    test('can be instantiated', () {
      final selector = ResourceFieldSelector();
      expect(selector, isNotNull);
    });

    test('can be instantiated with parameters', () {
      final selector = ResourceFieldSelector(
        containerName: 'web-app',
        resource: 'limits.cpu',
        divisor: '1m',
      );
      expect(selector.containerName, equals('web-app'));
      expect(selector.resource, equals('limits.cpu'));
      expect(selector.divisor, equals('1m'));
    });

    test('can be created from JSON', () {
      final json = {
        'containerName': 'database',
        'resource': 'requests.memory',
        'divisor': '1Mi',
      };
      final selector = ResourceFieldSelector.fromJson(json);
      expect(selector.containerName, equals('database'));
      expect(selector.resource, equals('requests.memory'));
      expect(selector.divisor, equals('1Mi'));
    });

    test('can be converted to JSON', () {
      final selector = ResourceFieldSelector(
        containerName: 'cache',
        resource: 'limits.ephemeral-storage',
        divisor: '1Gi',
      );
      final json = selector.toJson();
      expect(
          json,
          equals({
            'containerName': 'cache',
            'resource': 'limits.ephemeral-storage',
            'divisor': '1Gi',
          }));
    });

    test('fromMap creates instance from map data', () {
      final map = {
        'containerName': 'api-server',
        'resource': 'limits.memory',
        'divisor': '1Gi',
      };
      final selector = ResourceFieldSelector.fromMap(map);
      expect(selector.containerName, equals('api-server'));
      expect(selector.resource, equals('limits.memory'));
      expect(selector.divisor, equals('1Gi'));
    });

    test('null values are excluded from JSON', () {
      final selector = ResourceFieldSelector();
      final json = selector.toJson();
      expect(json.containsKey('containerName'), isFalse);
      expect(json.containsKey('resource'), isFalse);
      expect(json.containsKey('divisor'), isFalse);
    });
  });
}
