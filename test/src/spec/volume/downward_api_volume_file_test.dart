import 'package:kuberneteslib/src/spec/volume/downward_api_volume_file.dart';
import 'package:kuberneteslib/src/spec/object_field_selector.dart';
import 'package:kuberneteslib/src/spec/resource_field_selector.dart';
import 'package:test/test.dart';

void main() {
  group('DownwardAPIVolumeFile', () {
    test('can be instantiated', () {
      final file = DownwardAPIVolumeFile();
      expect(file, isNotNull);
    });

    test('serializes to JSON with all fields', () {
      final file = DownwardAPIVolumeFile(
        path: 'pod/labels',
        mode: 0644,
        fieldRef: ObjectFieldSelector(
          fieldPath: 'metadata.labels',
        ),
        resourceFieldRef: ResourceFieldSelector(
          containerName: 'app',
          resource: 'limits.cpu',
        ),
      );

      final json = file.toJson();
      
      expect(file.mode, equals(420));
      expect(json['mode'], equals('0644'));
      expect(json['fieldRef']['fieldPath'], equals('metadata.labels'));
      expect(json['resourceFieldRef'], {
        'containerName': 'app',
        'resource': 'limits.cpu',
      });
    });

    test('deserializes from JSON correctly', () {
      final json = {
        'path': 'container/memory',
        'mode': 420,
        'resourceFieldRef': {
          'containerName': 'web',
          'resource': 'requests.memory',
        }
      };

      final file = DownwardAPIVolumeFile.fromJson(json);

      expect(file.path, equals('container/memory'));
      expect(file.mode, equals(420));
      expect(file.resourceFieldRef?.containerName, equals('web'));
      expect(file.resourceFieldRef?.resource, equals('requests.memory'));
      expect(file.fieldRef, isNull);
    });

    test('omits null values in JSON output', () {
      final file = DownwardAPIVolumeFile(
        path: 'pod/name',
      );

      final json = file.toJson();

      expect(json.containsKey('mode'), isFalse);
      expect(json.containsKey('fieldRef'), isFalse);
      expect(json.containsKey('resourceFieldRef'), isFalse);
      expect(json['path'], equals('pod/name'));
    });

    test('handles both fieldRef and resourceFieldRef being null', () {
      final file = DownwardAPIVolumeFile(
        path: 'test',
        mode: 0600,
      );

      final json = file.toJson();
      final decoded = DownwardAPIVolumeFile.fromJson(json);

      expect(decoded.fieldRef, isNull);
      expect(decoded.resourceFieldRef, isNull);
      expect(decoded.path, equals('test'));
      expect(decoded.mode, equals(384)); // 0600 in decimal
    });
  });
} 