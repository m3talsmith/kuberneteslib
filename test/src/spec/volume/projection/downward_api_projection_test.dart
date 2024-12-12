import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/projection/downward_api_projection.dart';
import 'package:kuberneteslib/src/spec/volume/downward_api_volume_file.dart';
import 'package:kuberneteslib/src/spec/object_field_selector.dart';

void main() {
  group('DownwardAPIProjection', () {
    test('can be instantiated', () {
      final projection = DownwardAPIProjection();
      expect(projection, isNotNull);
      expect(projection.items, isNull);
    });

    test('can be instantiated with items', () {
      final projection = DownwardAPIProjection()
        ..items = [
          DownwardAPIVolumeFile()
            ..path = 'labels'
            ..fieldRef = ObjectFieldSelector(fieldPath: 'metadata.labels')
        ];

      expect(projection.items, hasLength(1));
      expect(projection.items![0].path, equals('labels'));
      expect(projection.items![0].fieldRef?.fieldPath, equals('metadata.labels'));
    });

    test('can be instantiated with empty items list', () {
      final projection = DownwardAPIProjection()..items = [];
      expect(projection.items, isEmpty);
    });

    test('can handle multiple items', () {
      final projection = DownwardAPIProjection()
        ..items = [
          DownwardAPIVolumeFile()
            ..path = 'labels'
            ..fieldRef = ObjectFieldSelector(fieldPath: 'metadata.labels'),
          DownwardAPIVolumeFile()
            ..path = 'annotations'
            ..fieldRef = ObjectFieldSelector(fieldPath: 'metadata.annotations')
        ];

      expect(projection.items, hasLength(2));
      expect(projection.items![0].path, equals('labels'));
      expect(projection.items![1].path, equals('annotations'));
    });

    group('json serialization', () {
      test('toJson produces correct map with null items', () {
        final projection = DownwardAPIProjection();
        final json = projection.toJson();
        
        expect(json, isEmpty);
      });

      test('toJson produces correct map with items', () {
        final projection = DownwardAPIProjection()
          ..items = [
            DownwardAPIVolumeFile()
              ..path = 'labels'
              ..fieldRef = ObjectFieldSelector(fieldPath: 'metadata.labels')
          ];

        final json = projection.toJson();
        
        expect(json, contains('items'));
        expect(json['items'], hasLength(1));
        expect(json['items'][0], contains('path'));
        expect(json['items'][0]['path'], equals('labels'));
        expect(json['items'][0], contains('fieldRef'));
        expect(json['items'][0]['fieldRef'], contains('fieldPath'));
        expect(json['items'][0]['fieldRef']['fieldPath'], equals('metadata.labels'));
      });

      test('fromJson creates correct instance', () {
        final json = {
          'items': [
            {
              'path': 'labels',
              'fieldRef': {
                'fieldPath': 'metadata.labels'
              }
            }
          ]
        };

        final projection = DownwardAPIProjection.fromJson(json);
        
        expect(projection.items, hasLength(1));
        expect(projection.items![0].path, equals('labels'));
        expect(projection.items![0].fieldRef?.fieldPath, equals('metadata.labels'));
      });

      test('toJson produces correct map with empty items list', () {
        final projection = DownwardAPIProjection()..items = [];
        final json = projection.toJson();
        
        expect(json, contains('items'));
        expect(json['items'], isEmpty);
      });

      test('fromJson creates instance with empty items list', () {
        final json = {'items': []};
        final projection = DownwardAPIProjection.fromJson(json);
        
        expect(projection.items, isEmpty);
      });

      test('fromJson handles missing items field', () {
        final json = <String, dynamic>{};
        final projection = DownwardAPIProjection.fromJson(json);
        
        expect(projection.items, isNull);
      });

      test('fromJson creates instance with multiple items', () {
        final json = {
          'items': [
            {
              'path': 'labels',
              'fieldRef': {
                'fieldPath': 'metadata.labels'
              }
            },
            {
              'path': 'annotations',
              'fieldRef': {
                'fieldPath': 'metadata.annotations'
              }
            }
          ]
        };

        final projection = DownwardAPIProjection.fromJson(json);
        
        expect(projection.items, hasLength(2));
        expect(projection.items![0].path, equals('labels'));
        expect(projection.items![0].fieldRef?.fieldPath, equals('metadata.labels'));
        expect(projection.items![1].path, equals('annotations'));
        expect(projection.items![1].fieldRef?.fieldPath, equals('metadata.annotations'));
      });
    });
  });
} 