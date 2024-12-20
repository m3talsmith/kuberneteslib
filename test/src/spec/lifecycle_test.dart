import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/lifecycle.dart';
import 'package:kuberneteslib/src/spec/lifecycle_handler.dart';
import 'package:kuberneteslib/src/spec/exec_action.dart';

void main() {
  group('Lifecycle', () {
    test('can be instantiated', () {
      final lifecycle = Lifecycle();
      expect(lifecycle, isNotNull);
      expect(lifecycle.postStart, isNull);
      expect(lifecycle.preStop, isNull);
    });

    group('JSON serialization', () {
      test('toJson() creates correct JSON with exec action', () {
        final lifecycle = Lifecycle()
          ..postStart = (LifecycleHandler()
            ..exec = (ExecAction()..command = ['/bin/sh', '-c', 'echo hello']))
          ..preStop = (LifecycleHandler()
            ..exec =
                (ExecAction()..command = ['/bin/sh', '-c', 'echo goodbye']));

        final json = lifecycle.toJson();
        expect(json['postStart']['exec']['command'],
            equals(['/bin/sh', '-c', 'echo hello']));
        expect(json['preStop']['exec']['command'],
            equals(['/bin/sh', '-c', 'echo goodbye']));
      });

      test('fromJson() creates correct object', () {
        final json = {
          'postStart': {
            'exec': {
              'command': ['/bin/sh', '-c', 'echo start']
            }
          },
          'preStop': {
            'exec': {
              'command': ['/bin/sh', '-c', 'echo stop']
            }
          }
        };

        final lifecycle = Lifecycle.fromJson(json);
        expect(lifecycle.postStart?.exec?.command,
            equals(['/bin/sh', '-c', 'echo start']));
        expect(lifecycle.preStop?.exec?.command,
            equals(['/bin/sh', '-c', 'echo stop']));
      });

      test('handles null values', () {
        final lifecycle = Lifecycle();
        final json = lifecycle.toJson();
        expect(json, isEmpty);

        final decoded = Lifecycle.fromJson(json);
        expect(decoded.postStart, isNull);
        expect(decoded.preStop, isNull);
      });

      test('handles partial values', () {
        final lifecycle = Lifecycle()
          ..postStart =
              (LifecycleHandler()..exec = (ExecAction()..command = ['test']));

        final json = lifecycle.toJson();
        expect(json['postStart'], isNotNull);
        expect(json['preStop'], isNull);

        final decoded = Lifecycle.fromJson(json);
        expect(decoded.postStart?.exec?.command, equals(['test']));
        expect(decoded.preStop, isNull);
      });
    });
  });
}
