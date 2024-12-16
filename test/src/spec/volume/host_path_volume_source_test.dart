import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/host_path_volume_source.dart';

void main() {
  group('HostPathVolumeSource', () {
    test('can be instantiated', () {
      final source = HostPathVolumeSource();
      expect(source, isNotNull);
    });

    test('can be created from JSON', () {
      final json = {
        'path': '/var/log',
        'type': 'DirectoryOrCreate',
      };

      final source = HostPathVolumeSource.fromJson(json);

      expect(source.path, '/var/log');
      expect(source.type, 'DirectoryOrCreate');
    });

    test('can be converted to JSON', () {
      final source = HostPathVolumeSource()
        ..path = '/var/log'
        ..type = 'DirectoryOrCreate';

      final json = source.toJson();

      expect(json, {
        'path': '/var/log',
        'type': 'DirectoryOrCreate',
      });
    });

    test('supports value equality', () {
      final source1 = HostPathVolumeSource()
        ..path = '/var/log'
        ..type = 'DirectoryOrCreate';

      final source2 = HostPathVolumeSource()
        ..path = '/var/log'
        ..type = 'DirectoryOrCreate';

      expect(source1.toJson(), equals(source2.toJson()));
    });
  });
}
