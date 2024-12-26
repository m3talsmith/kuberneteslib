import 'package:kuberneteslib/src/status/container/container_state/container_state_running.dart';
import 'package:test/test.dart';

void main() {
  group('ContainerStateRunning', () {
    test('can be instantiated', () {
      final state = ContainerStateRunning();
      expect(state, isNotNull);
      expect(state.startedAt, isNull);
    });

    test('can be instantiated with startedAt', () {
      final startTime = DateTime.utc(2024, 3, 14, 15, 30);
      final state = ContainerStateRunning(startedAt: startTime);
      expect(state.startedAt, equals(startTime));
    });

    group('JSON', () {
      test('toJson() includes non-null values', () {
        final startTime = DateTime.utc(2024, 3, 14, 15, 30);
        final state = ContainerStateRunning(startedAt: startTime);

        final json = state.toJson();
        expect(json, {
          'startedAt': '2024-03-14T15:30:00.000Z',
        });
      });

      test('toJson() excludes null values', () {
        final state = ContainerStateRunning();

        final json = state.toJson();
        expect(json, isEmpty);
      });

      test('fromJson() creates instance with startedAt', () {
        final json = {
          'startedAt': '2024-03-14T15:30:00Z',
        };

        final state = ContainerStateRunning.fromJson(json);
        expect(
          state.startedAt,
          equals(DateTime.utc(2024, 3, 14, 15, 30)),
        );
      });

      test('fromJson() handles missing startedAt', () {
        final json = <String, dynamic>{};

        final state = ContainerStateRunning.fromJson(json);
        expect(state.startedAt, isNull);
      });

      test('fromJson() handles null startedAt', () {
        final json = {'startedAt': null};

        final state = ContainerStateRunning.fromJson(json);
        expect(state.startedAt, isNull);
      });
    });
  });
}
