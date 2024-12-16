import 'package:test/test.dart';
import 'package:kuberneteslib/src/helpers/container_ports_converter.dart';
import 'package:kuberneteslib/src/spec/container_port.dart';

void main() {
  group('ContainerPortsConverter', () {
    final converter = ContainerPortsConverter();

    test('fromJson converts list of maps to list of ContainerPort objects', () {
      final json = [
        {'containerPort': 8080, 'protocol': 'TCP'},
        {'containerPort': 443, 'protocol': 'UDP'},
      ];

      final result = converter.fromJson(json.cast<Map<String, dynamic>>());

      expect(result, isA<List<ContainerPort>>());
      expect(result.length, 2);
      expect(result[0].containerPort, 8080);
      expect(result[0].protocol, 'TCP');
      expect(result[1].containerPort, 443);
      expect(result[1].protocol, 'UDP');
    });

    test('toJson converts list of ContainerPort objects to list of maps', () {
      final ports = [
        ContainerPort(containerPort: 8080, protocol: 'TCP'),
        ContainerPort(containerPort: 443, protocol: 'UDP'),
      ];

      final result = converter.toJson(ports);

      expect(result, isA<List<Map<String, dynamic>>>());
      expect(result.length, 2);
      expect(result[0]['containerPort'], 8080);
      expect(result[0]['protocol'], 'TCP');
      expect(result[1]['containerPort'], 443);
      expect(result[1]['protocol'], 'UDP');
    });

    test('fromJson handles empty list', () {
      final json = <Map<String, dynamic>>[];
      final result = converter.fromJson(json);
      expect(result, isEmpty);
    });

    test('toJson handles empty list', () {
      final ports = <ContainerPort>[];
      final result = converter.toJson(ports);
      expect(result, isEmpty);
    });
  });
}
