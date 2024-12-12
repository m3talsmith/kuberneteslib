import 'package:kuberneteslib/src/spec/container.dart';
import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/spec.dart';
import 'package:kuberneteslib/src/spec/pod_spec.dart';
import 'package:kuberneteslib/src/helpers/object_spec_converter.dart';

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
      expect(specJson['containers'][0]['name'], (json['containers'] as List<dynamic>?)?[0]['name']);
      expect(specJson['containers'][0]['image'], (json['containers'] as List<dynamic>?)?[0]['image']);
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
    test('creates PodSpec from JSON with explicit kind', () {
      final json = {
        'containers': [
          {
            'name': 'web',
            'image': 'nginx:1.14.2',
          }
        ],
      };

      final spec = Spec.fromJson(json, kind: 'pod');
      expect(spec.spec, isA<PodSpec>());
      expect(spec.spec?.toJson()['containers'], json['containers']);
    });

    test('creates PodSpec from JSON with kind in metadata', () {
      final json = {
        'metadata': {
          'kind': 'Pod',
        },
        'containers': [
          {
            'name': 'web',
            'image': 'nginx:1.14.2',
          }
        ],
      };

      final spec = Spec.fromJson(json);
      expect(spec.spec, isA<PodSpec>());
      expect(spec.spec?.toJson()['containers'], json['containers']);
    });

    test('defaults to PodSpec for unknown kind', () {
      final json = {
        'containers': [
          {
            'name': 'web',
            'image': 'nginx:1.14.2',
          }
        ],
      };

      final spec = Spec.fromJson(json, kind: 'Unknown');
      expect(spec.spec, isA<PodSpec>());
    });

    test('converts empty spec to empty JSON', () {
      final spec = Spec(spec: null);
      expect(spec.toJson(), isEmpty);
    });
  });
} 