import 'package:kuberneteslib/src/spec/container.dart';
import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/spec.dart';
import 'package:kuberneteslib/src/spec/pod_spec.dart';
import 'package:kuberneteslib/src/helpers/object_spec_converter.dart';
import 'package:kuberneteslib/src/resource/resource_kind.dart';

void main() {
  group('ObjectSpecConverter', () {
    const converter = ObjectSpecConverter();

    test('converts PodSpec from JSON correctly', () {
      final json = {
        'kind': 'Pod',
        'containers': [
          {
            'name': 'test-container',
            'image': 'nginx:latest',
          }
        ],
      };

      final spec = converter.fromJson(json);
      expect(spec, isA<PodSpec>());
      final specJson = spec.toJson();
      expect(specJson['containers'][0], isA<Map<String, dynamic>>());
      expect(specJson['containers'][0]['name'],
          (json['containers'] as List<dynamic>?)?[0]['name']);
      expect(specJson['containers'][0]['image'],
          (json['containers'] as List<dynamic>?)?[0]['image']);
    });

    test('converts PodSpec to JSON correctly', () {
      final podSpec = PodSpec(
        containers: [
          Container()
            ..name = 'test-container'
            ..image = 'nginx:latest'
        ],
      );

      final json = converter.toJson(podSpec);
      expect(json['kind'], equals('pod'));
      expect(json['containers'], isNotEmpty);
    });
  });

  group('Spec', () {
    test('creates from pod JSON with explicit kind', () {
      final podJson = {
        'kind': 'pod',
        'containers': [
          {
            'name': 'web',
            'image': 'nginx:1.14.2',
          }
        ]
      };

      final spec = Spec.fromJson(podJson, kind: ResourceKind.pod.name);

      expect(spec.spec, isA<PodSpec>());
      expect(spec.toJson(), equals(podJson));
    });

    test('creates from pod JSON with kind in metadata', () {
      final podJson = {
        'metadata': {
          'kind': 'Pod',
        },
        'containers': [
          {
            'name': 'web',
            'image': 'nginx:1.14.2',
          }
        ]
      };

      final spec = Spec.fromJson(podJson);

      expect(spec.spec, isA<PodSpec>());
      expect(spec.toJson()['containers'], equals(podJson['containers']));
    });

    test('defaults to PodSpec for unknown kind', () {
      final json = {
        'containers': [
          {
            'name': 'web',
            'image': 'nginx:1.14.2',
          }
        ]
      };

      final spec = Spec.fromJson(json, kind: 'unknown');

      expect(spec.spec, isA<PodSpec>());
    });

    test('returns empty map for null spec', () {
      final spec = Spec(spec: null);

      expect(spec.toJson(), equals({}));
    });
  });
}
