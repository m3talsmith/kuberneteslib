import 'package:test/test.dart';
import 'package:kuberneteslib/src/status/container/container_state/container_state_terminated.dart';

void main() {
  group('ContainerStateTerminated', () {
    test('can be instantiated', () {
      final state = ContainerStateTerminated();
      expect(state, isNotNull);
    });

    test('supports value equality', () {
      final state1 = ContainerStateTerminated(
        containerID: 'docker://abc123',
        exitCode: '0',
        finishedAt: DateTime.utc(2024, 3, 15),
        reason: 'Completed',
      );

      final state2 = ContainerStateTerminated(
        containerID: 'docker://abc123',
        exitCode: '0',
        finishedAt: DateTime.utc(2024, 3, 15),
        reason: 'Completed',
      );

      expect(state1.toJson(), equals(state2.toJson()));
    });

    group('JSON serialization', () {
      test('fromJson creates correct instance', () {
        final json = {
          'containerID': 'docker://abc123',
          'exitCode': '137',
          'finishedAt': '2024-03-15T10:30:00Z',
          'reason': 'Error',
          'signal': 9,
          'message': 'Container was terminated by SIGKILL',
          'startedAt': '2024-03-15T10:00:00Z',
        };

        final state = ContainerStateTerminated.fromJson(json);

        expect(state.containerID, equals('docker://abc123'));
        expect(state.exitCode, equals('137'));
        expect(state.finishedAt?.toUtc(),
            equals(DateTime.parse('2024-03-15T10:30:00Z')));
        expect(state.reason, equals('Error'));
        expect(state.signal, equals(9));
        expect(state.message, equals('Container was terminated by SIGKILL'));
        expect(state.startedAt?.toUtc(),
            equals(DateTime.parse('2024-03-15T10:00:00Z')));
      });

      test('toJson creates correct map', () {
        final state = ContainerStateTerminated(
          containerID: 'docker://abc123',
          exitCode: '0',
          finishedAt: DateTime.utc(2024, 3, 15, 10, 30),
          reason: 'Completed',
          startedAt: DateTime.utc(2024, 3, 15, 10, 0),
        );

        final json = state.toJson();

        expect(json, {
          'containerID': 'docker://abc123',
          'exitCode': '0',
          'finishedAt': '2024-03-15T10:30:00.000Z',
          'reason': 'Completed',
          'startedAt': '2024-03-15T10:00:00.000Z',
        });
      });

      test('toJson omits null values', () {
        final state = ContainerStateTerminated(
          containerID: 'docker://abc123',
          exitCode: '0',
        );

        final json = state.toJson();

        expect(json, {
          'containerID': 'docker://abc123',
          'exitCode': '0',
        });
        expect(json.containsKey('finishedAt'), isFalse);
        expect(json.containsKey('reason'), isFalse);
        expect(json.containsKey('signal'), isFalse);
        expect(json.containsKey('message'), isFalse);
        expect(json.containsKey('startedAt'), isFalse);
      });
    });

    group('field validations', () {
      test('accepts valid container ID formats', () {
        final state = ContainerStateTerminated(
          containerID: 'docker://abc123def456',
        );
        expect(state.containerID, equals('docker://abc123def456'));
      });

      test('handles various exit codes', () {
        final state = ContainerStateTerminated(
          exitCode: '137', // SIGKILL
        );
        expect(state.exitCode, equals('137'));
      });

      test('handles DateTime fields correctly', () {
        final now = DateTime.now();
        final state = ContainerStateTerminated(
          startedAt: now,
          finishedAt: now.add(Duration(minutes: 30)),
        );

        expect(state.startedAt, equals(now));
        expect(
          state.finishedAt?.difference(state.startedAt!),
          equals(Duration(minutes: 30)),
        );
      });
    });
  });
}
