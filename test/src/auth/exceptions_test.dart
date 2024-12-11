import 'package:test/test.dart';
import 'package:kuberneteslib/src/auth/exceptions.dart';

void main() {
  group('MissingAuthException', () {
    test('should be instantiable', () {
      expect(() => MissingAuthException(), returnsNormally);
    });

    test('should implement Exception', () {
      expect(MissingAuthException(), isA<Exception>());
    });

    test('should be throwable', () {
      expect(() => throw MissingAuthException(), throwsA(isA<MissingAuthException>()));
    });
  });
} 