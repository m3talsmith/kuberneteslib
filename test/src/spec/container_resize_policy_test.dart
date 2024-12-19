import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/container_resize_policy.dart';

void main() {
  group('ContainerResizePolicy', () {
    test('creates instance with required values', () {
      final policy = ContainerResizePolicy()
        ..resourceName = 'memory'
        ..restartPolicy = 'NotRequired';

      expect(policy.resourceName, equals('memory'));
      expect(policy.restartPolicy, equals('NotRequired'));
    });

    group('JSON serialization', () {
      test('serializes to JSON with all fields', () {
        final policy = ContainerResizePolicy()
          ..resourceName = 'cpu'
          ..restartPolicy = 'RestartContainer';

        final json = policy.toJson();

        expect(
            json,
            equals({
              'resourceName': 'cpu',
              'restartPolicy': 'RestartContainer',
            }));
      });

      test('deserializes from JSON', () {
        final json = {
          'resourceName': 'memory',
          'restartPolicy': 'NotRequired',
        };

        final policy = ContainerResizePolicy.fromJson(json);

        expect(policy.resourceName, equals('memory'));
        expect(policy.restartPolicy, equals('NotRequired'));
      });
    });
  });
}
