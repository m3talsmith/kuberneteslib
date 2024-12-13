import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/downward_api_volume_source.dart';
import 'package:kuberneteslib/src/spec/volume/downward_api_volume_file.dart';
import 'package:kuberneteslib/src/spec/object_field_selector.dart';
import 'package:kuberneteslib/src/spec/resource_field_selector.dart';

void main() {
  group('DownwardAPIVolumeSource', () {
    test('can be instantiated', () {
      final source = DownwardAPIVolumeSource();
      expect(source, isNotNull);
    });

    test('serializes to JSON correctly', () {
      final source = DownwardAPIVolumeSource()
        ..defaultMode = 420 // equivalent to 0644 octal
        ..items = [
          DownwardAPIVolumeFile()
            ..path = 'labels'
            ..fieldRef = (ObjectFieldSelector()..fieldPath = 'metadata.labels'),
          DownwardAPIVolumeFile()
            ..path = 'cpu_limit'
            ..resourceFieldRef =
                (ResourceFieldSelector()..resource = 'limits.cpu'),
        ];

      final json = source.toJson();
      
      expect(source.defaultMode, equals(420));
      expect(json['defaultMode'], equals('0644'));
      expect(json['items'], isList);
      expect(json['items'].length, equals(2));
      
      final firstItem = json['items'][0];
      expect(firstItem['path'], equals('labels'));
      expect(firstItem['fieldRef']['fieldPath'], equals('metadata.labels'));
      
      final secondItem = json['items'][1];
      expect(secondItem['path'], equals('cpu_limit'));
      expect(secondItem['resourceFieldRef']['resource'], equals('limits.cpu'));
    });

    test('deserializes from JSON correctly', () {
      final json = {
        'defaultMode': 420,
        'items': [
          {
            'path': 'labels',
            'fieldRef': {'fieldPath': 'metadata.labels'}
          },
          {
            'path': 'cpu_limit',
            'resourceFieldRef': {'resource': 'limits.cpu'}
          }
        ]
      };

      final source = DownwardAPIVolumeSource.fromJson(json);
      
      expect(source.defaultMode, equals(420));
      expect(source.items?.length, equals(2));
      
      expect(source.items?[0].path, equals('labels'));
      expect(source.items?[0].fieldRef?.fieldPath, equals('metadata.labels'));
      
      expect(source.items?[1].path, equals('cpu_limit'));
      expect(source.items?[1].resourceFieldRef?.resource, equals('limits.cpu'));
    });
  });
} 