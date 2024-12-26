import 'package:kuberneteslib/src/status/container/container_state/container_state_waiting.dart';
import 'package:test/test.dart';

void main() {
  group('ContainerStateWaiting', () {
    test('can be instantiated', () {
      final state = ContainerStateWaiting(
        message: 'Container is waiting',
        reason: 'ContainerCreating',
      );

      expect(state.message, equals('Container is waiting'));
      expect(state.reason, equals('ContainerCreating'));
    });

    test('can be instantiated with null values', () {
      final state = ContainerStateWaiting();

      expect(state.message, isNull);
      expect(state.reason, isNull);
    });

    test('can be serialized to JSON', () {
      final state = ContainerStateWaiting(
        message: 'Container is waiting',
        reason: 'ContainerCreating',
      );

      final json = state.toJson();

      expect(json, {
        'message': 'Container is waiting',
        'reason': 'ContainerCreating',
      });
    });

    test('can be deserialized from JSON', () {
      final json = {
        'message': 'Container is waiting',
        'reason': 'ContainerCreating',
      };

      final state = ContainerStateWaiting.fromJson(json);

      expect(state.message, equals('Container is waiting'));
      expect(state.reason, equals('ContainerCreating'));
    });

    test('omits null values when serializing to JSON', () {
      final state = ContainerStateWaiting();
      final json = state.toJson();

      expect(json, isEmpty);
    });
  });
}
