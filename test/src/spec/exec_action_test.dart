import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/exec_action.dart';

void main() {
  group('ExecAction', () {
    test('can be instantiated', () {
      final execAction = ExecAction();
      expect(execAction, isNotNull);
      expect(execAction.command, isNull);
    });

    test('can be created with a command', () {
      final execAction = ExecAction()
        ..command = ['/bin/sh', '-c', 'echo "Hello"'];
      expect(execAction.command, hasLength(3));
      expect(execAction.command, equals(['/bin/sh', '-c', 'echo "Hello"']));
    });

    group('JSON serialization', () {
      test('toJson() excludes null command', () {
        final execAction = ExecAction();
        expect(execAction.toJson(), isEmpty);
      });

      test('toJson() includes command when present', () {
        final execAction = ExecAction()
          ..command = ['/bin/sh', '-c', 'echo "Hello"'];

        final json = execAction.toJson();
        expect(json, {
          'command': ['/bin/sh', '-c', 'echo "Hello"'],
        });
      });

      test('fromJson() creates instance with null command', () {
        final execAction = ExecAction.fromJson({});
        expect(execAction.command, isNull);
      });

      test('fromJson() creates instance with command', () {
        final execAction = ExecAction.fromJson({
          'command': ['/bin/sh', '-c', 'echo "Hello"'],
        });
        expect(execAction.command, equals(['/bin/sh', '-c', 'echo "Hello"']));
      });
    });
  });
}
