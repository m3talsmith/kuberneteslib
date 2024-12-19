import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/config_map_env_source.dart';

void main() {
  group('ConfigMapEnvSource', () {
    test('can be instantiated', () {
      final source = ConfigMapEnvSource();
      expect(source, isNotNull);
    });

    test('supports JSON serialization', () {
      final source = ConfigMapEnvSource()
        ..name = 'test-config'
        ..optional = true;

      final json = source.toJson();
      expect(json, {
        'name': 'test-config',
        'optional': true,
      });
    });

    test('supports JSON deserialization', () {
      final json = {
        'name': 'test-config',
        'optional': true,
      };

      final source = ConfigMapEnvSource.fromJson(json);
      expect(source.name, equals('test-config'));
      expect(source.optional, isTrue);
    });

    test('omits null values in JSON serialization', () {
      final source = ConfigMapEnvSource();
      final json = source.toJson();
      expect(json, isEmpty);
    });

    test('handles partial JSON deserialization', () {
      final json = {'name': 'test-config'};
      final source = ConfigMapEnvSource.fromJson(json);
      expect(source.name, equals('test-config'));
      expect(source.optional, isNull);
    });
  });
}
