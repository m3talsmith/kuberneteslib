import 'dart:convert';

import 'package:kuberneteslib/src/spec/container_port.dart';
import 'package:test/test.dart';
import 'package:kuberneteslib/src/helpers/containers_converter.dart';
import 'package:kuberneteslib/src/spec/container.dart';

void main() {
  group('ContainersConverter', () {
    const converter = ContainersConverter();

    test('fromJson converts list of maps to list of Containers', () {
      final json = [
        {
          'name': 'container1',
          'image': 'nginx:latest',
          'ports': [
            {
              'containerPort': 80,
              'hostPort': 80,
            },
          ],
        },
        {
          'name': 'container2',
          'image': 'redis:latest',
          'ports': [
            {
              'containerPort': 6379,
              'hostPort': 6379,
            },
          ],
        },
      ];

      final containers = converter.fromJson(json);

      expect(containers.length, 2);
      expect(containers[0].name, 'container1');
      expect(containers[0].image, 'nginx:latest');
      expect(jsonEncode(containers[0].ports),
          jsonEncode([ContainerPort(hostPort: 80, containerPort: 80)]));
      expect(containers[1].name, 'container2');
      expect(containers[1].image, 'redis:latest');
      expect(jsonEncode(containers[1].ports),
          jsonEncode([ContainerPort(hostPort: 6379, containerPort: 6379)]));
    });

    test('toJson converts list of Containers to list of maps', () {
      final containers = [
        SpecContainer(
          name: 'container1',
          image: 'nginx:latest',
          ports: [ContainerPort(hostPort: 80, containerPort: 80)],
        ),
        SpecContainer(
          name: 'container2',
          image: 'redis:latest',
          ports: [ContainerPort(hostPort: 6379, containerPort: 6379)],
        ),
      ];

      final json = converter.toJson(containers);

      expect(json.length, 2);
      expect(json[0]['name'], 'container1');
      expect(json[0]['image'], 'nginx:latest');
      expect(jsonEncode(json[0]['ports']),
          jsonEncode([ContainerPort(hostPort: 80, containerPort: 80)]));
      expect(json[1]['name'], 'container2');
      expect(json[1]['image'], 'redis:latest');
      expect(jsonEncode(json[1]['ports']),
          jsonEncode([ContainerPort(hostPort: 6379, containerPort: 6379)]));
    });
  });
}
