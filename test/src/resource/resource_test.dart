import 'package:kuberneteslib/src/auth/exceptions.dart';
import 'package:kuberneteslib/src/meta/object_meta.dart';
import 'package:kuberneteslib/src/resource/resource.dart';
import 'package:kuberneteslib/src/spec/pod_spec.dart';
import 'package:test/test.dart';

void main() {
  group('Resource', () {

    test('getApi returns correct API paths', () {
      expect(Resource.getApi(resourceKind: 'pod'), equals('/api/v1'));
      expect(Resource.getApi(resourceKind: 'deployment'), equals('/apis/apps/v1'));
      expect(Resource.getApi(resourceKind: 'job'), equals('/apis/batch/v1'));
      expect(Resource.getApi(resourceKind: 'unknown'), equals('/api/v1'));
    });

    test('fromJson creates Resource with correct fields', () {
      final json = {
        'kind': 'pod',
        'metadata': {
          'name': 'test-pod',
          'namespace': 'default'
        },
        'spec': {
          'kind': 'pod',
          'containers': [
            {
              'name': 'test-container',
              'image': 'nginx'
            }
          ]
        }
      };

      final resource = Resource.fromJson(json);
      
      expect(resource.kind, equals('pod'));
      expect(resource.metadata?.name, equals('test-pod'));
      expect(resource.metadata?.namespace, equals('default'));
      expect(resource.spec, isNotNull);
      final podSpec = PodSpec.fromJson(resource.spec?.toJson() ?? {});
      expect(podSpec.containers, isNotNull);
      expect(podSpec.containers?.length, equals(1));
      expect(podSpec.containers?[0].name, equals('test-container'));
      expect(podSpec.containers?[0].image, equals('nginx'));
    });

    test('toJson serializes Resource correctly', () {
      final resource = Resource(
        kind: 'Pod',
        metadata: ObjectMeta(
          name: 'test-pod',
          namespace: 'default'
        ),
      );

      final json = resource.toJson();
      
      expect(json['kind'], equals('Pod'));
      expect(json['metadata']['name'], equals('test-pod'));
      expect(json['metadata']['namespace'], equals('default'));
    });

    test('list throws MissingAuthException when auth is null', () {
      expect(
        () => Resource.list(resourceKind: 'pod', auth: null),
        throwsA(isA<MissingAuthException>())
      );
    });

    test('show throws MissingAuthException when auth is null', () {
      expect(
        () => Resource.show(
          resourceKind: 'pod',
          resourceName: 'test-pod',
          auth: null
        ),
        throwsA(isA<MissingAuthException>())
      );
    });

    test('fromYaml creates Resource from valid YAML', () {
      final yaml = '''
apiVersion: v1
kind: Pod
metadata:
  name: test-pod
  namespace: default
spec:
  containers:
    - name: test-container
      image: nginx
''';

      final resource = Resource.fromYaml(yaml);
      
      expect(resource, isNotNull);
      expect(resource?.kind, equals('pod'));
      expect(resource?.metadata?.name, equals('test-pod'));
      expect(resource?.metadata?.namespace, equals('default'));
    });

    test('toKubernetesYaml generates valid YAML', () {
      final resource = Resource(
        kind: 'Pod',
        metadata: ObjectMeta(
          name: 'test-pod',
          namespace: 'default',
          annotations: {'test': 'value'},
          labels: {'app': 'test'}
        ),
      );

      final yaml = resource.toKubernetesYaml();
      
      expect(yaml, contains('kind: Pod'));
      expect(yaml, contains('test: value'));
      expect(yaml, contains('app: test'));
    });
  });
} 