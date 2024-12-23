import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/toleration.dart';

void main() {
  group('Toleration', () {
    test('can be instantiated', () {
      final toleration = Toleration();
      expect(toleration, isNotNull);
    });

    test('supports JSON serialization', () {
      final toleration = Toleration()
        ..key = 'node-role.kubernetes.io/master'
        ..operator = 'Exists'
        ..effect = 'NoSchedule';

      final json = toleration.toJson();
      expect(json, {
        'key': 'node-role.kubernetes.io/master',
        'operator': 'Exists',
        'effect': 'NoSchedule',
      });

      final fromJson = Toleration.fromJson(json);
      expect(fromJson.key, 'node-role.kubernetes.io/master');
      expect(fromJson.operator, 'Exists');
      expect(fromJson.effect, 'NoSchedule');
    });

    test('handles all fields correctly', () {
      final toleration = Toleration()
        ..key = 'dedicated'
        ..operator = 'Equal'
        ..value = 'gpu'
        ..effect = 'NoExecute'
        ..tolerationSeconds = 3600;

      final json = toleration.toJson();
      expect(json, {
        'key': 'dedicated',
        'operator': 'Equal',
        'value': 'gpu',
        'effect': 'NoExecute',
        'tolerationSeconds': 3600,
      });

      final fromJson = Toleration.fromJson(json);
      expect(fromJson.key, 'dedicated');
      expect(fromJson.operator, 'Equal');
      expect(fromJson.value, 'gpu');
      expect(fromJson.effect, 'NoExecute');
      expect(fromJson.tolerationSeconds, 3600);
    });

    test('handles null fields', () {
      final toleration = Toleration();
      final json = toleration.toJson();

      expect(json, {});

      final fromJson = Toleration.fromJson(json);
      expect(fromJson.key, isNull);
      expect(fromJson.operator, isNull);
      expect(fromJson.value, isNull);
      expect(fromJson.effect, isNull);
      expect(fromJson.tolerationSeconds, isNull);
    });

    test('common use case - master node toleration', () {
      final toleration = Toleration()
        ..key = 'node-role.kubernetes.io/master'
        ..operator = 'Exists'
        ..effect = 'NoSchedule';

      expect(toleration.key, 'node-role.kubernetes.io/master');
      expect(toleration.operator, 'Exists');
      expect(toleration.effect, 'NoSchedule');
      expect(toleration.value, isNull);
      expect(toleration.tolerationSeconds, isNull);
    });

    test('common use case - temporary NoExecute toleration', () {
      final toleration = Toleration()
        ..key = 'node.kubernetes.io/not-ready'
        ..operator = 'Exists'
        ..effect = 'NoExecute'
        ..tolerationSeconds = 300;

      expect(toleration.key, 'node.kubernetes.io/not-ready');
      expect(toleration.operator, 'Exists');
      expect(toleration.effect, 'NoExecute');
      expect(toleration.tolerationSeconds, 300);
      expect(toleration.value, isNull);
    });
  });
}
