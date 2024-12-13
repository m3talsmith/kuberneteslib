import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/quobyte_volume_source.dart';

void main() {
  group('QuobyteVolumeSource', () {
    test('can be instantiated', () {
      final source = QuobyteVolumeSource();
      expect(source, isNotNull);
    });

    test('serializes to JSON correctly', () {
      final source = QuobyteVolumeSource()
        ..registry = 'registry.example.com:7861'
        ..volume = 'testVolume'
        ..user = 'admin'
        ..group = 'admin'
        ..tenant = 'development'
        ..readOnly = false;

      final json = source.toJson();
      
      expect(json, {
        'registry': 'registry.example.com:7861',
        'volume': 'testVolume',
        'user': 'admin',
        'group': 'admin',
        'tenant': 'development',
        'readOnly': false,
      });
    });

    test('deserializes from JSON correctly', () {
      final json = {
        'registry': 'registry.example.com:7861',
        'volume': 'testVolume',
        'user': 'admin',
        'group': 'admin',
        'tenant': 'development',
        'readOnly': true,
      };

      final source = QuobyteVolumeSource.fromJson(json);
      
      expect(source.registry, equals('registry.example.com:7861'));
      expect(source.volume, equals('testVolume'));
      expect(source.user, equals('admin'));
      expect(source.group, equals('admin'));
      expect(source.tenant, equals('development'));
      expect(source.readOnly, isTrue);
    });

    test('handles multiple registry entries', () {
      final source = QuobyteVolumeSource()
        ..registry = 'registry-1:7861,registry-2:7861'
        ..volume = 'testVolume'
        ..user = 'admin'
        ..group = 'admin';

      final json = source.toJson();
      final deserialized = QuobyteVolumeSource.fromJson(json);

      expect(deserialized.registry, equals('registry-1:7861,registry-2:7861'));
    });
  });
} 