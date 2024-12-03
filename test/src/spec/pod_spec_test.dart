import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/pod_spec.dart';
import 'package:kuberneteslib/src/spec/resource_requirements.dart';
import 'package:kuberneteslib/src/spec/container.dart';
import 'package:kuberneteslib/src/spec/quantity.dart';

void main() {
  group('PodSpec', () {
    late PodSpec podSpec;

    setUp(() {
      podSpec = PodSpec()
        ..containers = [
          Container()
            ..name = 'test-container'
            ..image = 'nginx:latest'
            ..resources = (ResourceRequirements()
              ..limits = {
                'cpu': Quantity(0.1),
                'memory': Quantity(134217728),
              }
              ..requests = {
                'cpu': Quantity(0.05),
                'memory': Quantity(67108864)
              })
        ];
    });

    test('creates instance with correct properties', () {
      expect(podSpec.containers, hasLength(1));
      expect(podSpec.containers!.first.name, equals('test-container'));
      expect(podSpec.containers!.first.image, equals('nginx:latest'));
    });

    test('validates container resources', () {
      final container = podSpec.containers!.first;
      expect(
        container.resources?.limits?['cpu']?.value,
        equals(0.1),
      );
      expect(
        container.resources?.requests?['memory']?.format(),
        equals('64Mi'),
      );
    });

    test('throws ArgumentError when containers list is empty', () {
      expect(
        () => PodSpec()..containers = [],
        throwsA(isA<ArgumentError>()),
      );
    });
  });
} 