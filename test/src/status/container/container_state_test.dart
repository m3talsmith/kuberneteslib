import 'package:kuberneteslib/src/status/container/container_state.dart';
import 'package:kuberneteslib/src/status/container/container_state/container_state_running.dart';
import 'package:kuberneteslib/src/status/container/container_state/container_state_terminated.dart';
import 'package:kuberneteslib/src/status/container/container_state/container_state_waiting.dart';
import 'package:test/test.dart';

void main() {
  group('ContainerState', () {
    test('can be instantiated', () {
      expect(ContainerState(), isNotNull);
    });

    group('JSON serialization', () {
      test('running state serialization', () {
        final startTime = DateTime.utc(2024, 3, 14, 12);
        final state = ContainerState(
          running: ContainerStateRunning(startedAt: startTime),
        );

        final json = state.toJson();

        final deserialized = ContainerState.fromJson(json);
        expect(deserialized.running?.startedAt, startTime);
        expect(deserialized.terminated, isNull);
        expect(deserialized.waiting, isNull);
      });

      test('terminated state serialization', () {
        final startTime = DateTime.utc(2024, 3, 14, 12);
        final endTime = DateTime.utc(2024, 3, 14, 13);
        final state = ContainerState(
          terminated: ContainerStateTerminated(
            exitCode: '1',
            reason: 'Error',
            message: 'Process crashed',
            startedAt: startTime,
            finishedAt: endTime,
          ),
        );

        final json = state.toJson();
        expect(json, {
          'terminated': {
            'exitCode': '1',
            'reason': 'Error',
            'message': 'Process crashed',
            'startedAt': '2024-03-14T12:00:00.000Z',
            'finishedAt': '2024-03-14T13:00:00.000Z',
          },
        });

        final deserialized = ContainerState.fromJson(json);
        expect(deserialized.terminated?.exitCode, '1');
        expect(deserialized.terminated?.reason, 'Error');
        expect(deserialized.terminated?.message, 'Process crashed');
        expect(deserialized.terminated?.startedAt, startTime);
        expect(deserialized.terminated?.finishedAt, endTime);
        expect(deserialized.running, isNull);
        expect(deserialized.waiting, isNull);
      });

      test('waiting state serialization', () {
        final state = ContainerState(
          waiting: ContainerStateWaiting(
            reason: 'ContainerCreating',
            message: 'Pulling image...',
          ),
        );

        final json = state.toJson();
        expect(json, {
          'waiting': {
            'reason': 'ContainerCreating',
            'message': 'Pulling image...',
          },
        });

        final deserialized = ContainerState.fromJson(json);
        expect(deserialized.waiting?.reason, 'ContainerCreating');
        expect(deserialized.waiting?.message, 'Pulling image...');
        expect(deserialized.running, isNull);
        expect(deserialized.terminated, isNull);
      });

      test('empty state serialization', () {
        final state = ContainerState();
        final json = state.toJson();
        expect(json, isEmpty);

        final deserialized = ContainerState.fromJson(json);
        expect(deserialized.running, isNull);
        expect(deserialized.terminated, isNull);
        expect(deserialized.waiting, isNull);
      });

      test('null values are excluded from JSON', () {
        final state = ContainerState(
          running: null,
          terminated: null,
          waiting: null,
        );
        final json = state.toJson();
        expect(json, isEmpty);
      });
    });
  });
}
