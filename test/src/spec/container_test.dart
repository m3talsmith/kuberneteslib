import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/container.dart';
import 'package:kuberneteslib/src/spec/container_port.dart';
import 'package:kuberneteslib/src/spec/resource_requirements.dart';
import 'package:kuberneteslib/src/spec/volume_mount.dart';

void main() {
  group('Container', () {
    test('creates empty container', () {
      final container = Container();
      expect(container.toJson(), isEmpty);
    });

    test('serializes basic container configuration', () {
      final container = Container(
        name: 'web-server',
        image: 'nginx:1.14.2',
        imagePullPolicy: 'IfNotPresent',
      );

      expect(container.toJson(), {
        'name': 'web-server',
        'image': 'nginx:1.14.2',
        'imagePullPolicy': 'IfNotPresent',
      });
    });

    test('serializes container with ports', () {
      final container = Container(
        name: 'web-server',
        ports: [
          ContainerPort(
            containerPort: 80,
            name: 'http',
            protocol: 'TCP',
          ),
        ],
      );

      expect(container.toJson(), {
        'name': 'web-server',
        'ports': [
          {
            'containerPort': 80,
            'name': 'http',
            'protocol': 'TCP',
          },
        ],
      });
    });

    test('serializes container with resources', () {
      final container = Container(
        name: 'web-server',
        resources: ResourceRequirements(
          requests: {
            'cpu': '250m',
            'memory': '64Mi',
          },
          limits: {
            'cpu': '500m',
            'memory': '128Mi',
          },
        ),
      );

      expect(container.toJson(), {
        'name': 'web-server',
        'resources': {
          'requests': {
            'cpu': '250m',
            'memory': '64Mi',
          },
          'limits': {
            'cpu': '500m',
            'memory': '128Mi',
          },
        },
      });
    });

    test('deserializes from JSON', () {
      final json = {
        'name': 'web-server',
        'image': 'nginx:1.14.2',
        'ports': [
          {
            'containerPort': 80,
            'name': 'http',
          }
        ],
        'env': [
          {
            'name': 'DATABASE_URL',
            'value': 'postgres://localhost:5432',
          }
        ],
      };

      final container = Container.fromJson(json);

      expect(container.name, 'web-server');
      expect(container.image, 'nginx:1.14.2');
      expect(container.ports?.length, 1);
      expect(container.ports?.first.containerPort, 80);
      expect(container.env?.length, 1);
      expect(container.env?.first.name, 'DATABASE_URL');
    });

    test('handles volume mounts correctly', () {
      final container = Container(
        name: 'storage-container',
        volumeMounts: [
          VolumeMount(
            name: 'config-volume',
            mountPath: '/etc/config',
            readOnly: true,
          ),
        ],
      );

      expect(container.toJson(), {
        'name': 'storage-container',
        'volumeMounts': [
          {
            'name': 'config-volume',
            'mountPath': '/etc/config',
            'readOnly': true,
          },
        ],
      });
    });
  });
}
