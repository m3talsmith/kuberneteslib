import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/container_port.dart';

void main() {
  group('ContainerPort', () {
    test('creates instance with default values', () {
      final port = ContainerPort();
      expect(port.containerPort, isNull);
      expect(port.hostIP, isNull);
      expect(port.hostPort, isNull);
      expect(port.name, isNull);
      expect(port.protocol, isNull);
    });

    test('creates instance with all values', () {
      final port = ContainerPort(
        containerPort: 8080,
        hostIP: '0.0.0.0',
        hostPort: 80,
        name: 'http',
        protocol: 'TCP',
      );

      expect(port.containerPort, equals(8080));
      expect(port.hostIP, equals('0.0.0.0'));
      expect(port.hostPort, equals(80));
      expect(port.name, equals('http'));
      expect(port.protocol, equals('TCP'));
    });

    group('JSON serialization', () {
      test('serializes to JSON with all fields', () {
        final port = ContainerPort(
          containerPort: 8080,
          hostIP: '0.0.0.0',
          hostPort: 80,
          name: 'http',
          protocol: 'TCP',
        );

        final json = port.toJson();

        expect(
            json,
            equals({
              'containerPort': 8080,
              'hostIP': '0.0.0.0',
              'hostPort': 80,
              'name': 'http',
              'protocol': 'TCP',
            }));
      });

      test('serializes to JSON excluding null fields', () {
        final port = ContainerPort(
          containerPort: 8080,
          protocol: 'TCP',
        );

        final json = port.toJson();

        expect(
            json,
            equals({
              'containerPort': 8080,
              'protocol': 'TCP',
            }));
        expect(json.containsKey('hostIP'), isFalse);
        expect(json.containsKey('hostPort'), isFalse);
        expect(json.containsKey('name'), isFalse);
      });

      test('deserializes from JSON', () {
        final json = {
          'containerPort': 8080,
          'hostIP': '0.0.0.0',
          'hostPort': 80,
          'name': 'http',
          'protocol': 'TCP',
        };

        final port = ContainerPort.fromJson(json);

        expect(port.containerPort, equals(8080));
        expect(port.hostIP, equals('0.0.0.0'));
        expect(port.hostPort, equals(80));
        expect(port.name, equals('http'));
        expect(port.protocol, equals('TCP'));
      });
    });
  });
}
