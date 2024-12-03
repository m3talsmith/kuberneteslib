import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/spec.dart';
import 'package:kuberneteslib/src/resource/resource_kind.dart';
import 'package:kuberneteslib/src/spec/pod_spec.dart';
import 'package:kuberneteslib/src/spec/container.dart';

void main() {
  group('ObjectSpecConverter', () {
    const converter = ObjectSpecConverter();

    test('converts pod spec from json', () {
      final json = {
        'kind': 'pod',
        'containers': [
          {
            'name': 'test-container',
            'image': 'nginx:latest',
          }
        ],
      };

      final spec = converter.fromJson(json);
      expect(spec, isA<PodSpec>());
      expect(spec.toJson(), containsPair('kind', 'pod'));
    });

    test('defaults to pod spec when kind is not found', () {
      final json = {
        'kind': 'unknown',
        'containers': [
          {
            'name': 'test-container',
            'image': 'nginx:latest',
          }
        ],
      };

      final spec = converter.fromJson(json);
      expect(spec, isA<PodSpec>());
    });

    test('converts spec to json', () {
      final podSpec = PodSpec(
        containers: [
          Container()
            ..name = 'test-container'
            ..image = 'nginx:latest'
        ],
      );

      final json = converter.toJson(podSpec);
      expect(json, isA<Map<String, dynamic>>());
      expect(json['containers'], isNotEmpty);
    });
  });

  group('Spec', () {
    test('creates pod spec from json', () {
      final podSpec = PodSpec(
        containers: [
          Container()
            ..name = 'test-container'
            ..image = 'nginx:latest'
        ],
      );
      final spec = Spec(spec: podSpec);
      expect(spec.spec, isA<PodSpec>());
      expect(spec.toJson(), containsPair('containers', isNotEmpty));
    });

    test('defaults to pod spec for unknown resource kind', () {
      final json = {
        'containers': [
          {
            'name': 'test-container',
            'image': 'nginx:latest',
          }
        ],
      };

      final spec = Spec.fromJson(json, kind: ResourceKind.pod);
      expect(spec.spec, isA<PodSpec>());
    });

    test('returns empty map for null spec', () {
      final spec = Spec(spec: null);
      expect(spec.toJson(), isEmpty);
    });
  });
} 