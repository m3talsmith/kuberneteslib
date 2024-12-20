import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/grpc_action.dart';

void main() {
  group('GRPCAction', () {
    test('can be instantiated', () {
      expect(GRPCAction(), isNotNull);
    });

    test('supports JSON serialization', () {
      final action = GRPCAction()
        ..port = 9000
        ..service = 'grpc.health.v1.Health';

      final json = action.toJson();
      expect(json, {
        'port': 9000,
        'service': 'grpc.health.v1.Health',
      });
    });

    test('supports JSON deserialization', () {
      final json = {
        'port': 8080,
        'service': 'my.service.v1.HealthCheck',
      };

      final action = GRPCAction.fromJson(json);
      expect(action.port, 8080);
      expect(action.service, 'my.service.v1.HealthCheck');
    });

    test('omits null values in JSON', () {
      final action = GRPCAction();
      final json = action.toJson();
      expect(json, isEmpty);
    });

    test('handles partial JSON data', () {
      final action = GRPCAction.fromJson({'port': 9000});
      expect(action.port, 9000);
      expect(action.service, isNull);
    });

    test('allows valid port numbers', () {
      final action = GRPCAction()..port = 1;
      expect(action.port, 1);

      action.port = 65535;
      expect(action.port, 65535);

      action.port = 8080;
      expect(action.port, 8080);
    });

    test('supports typical service name formats', () {
      final action = GRPCAction()..service = 'simple.Service';
      expect(action.service, 'simple.Service');

      action.service = 'my.complex.v1.Service';
      expect(action.service, 'my.complex.v1.Service');

      action.service = 'grpc.health.v1.Health';
      expect(action.service, 'grpc.health.v1.Health');
    });

    test('can be copied with new values', () {
      final original = GRPCAction()
        ..port = 9000
        ..service = 'test.Service';

      final json = original.toJson();
      final copy = GRPCAction.fromJson(json);

      expect(copy.port, original.port);
      expect(copy.service, original.service);
      expect(copy, isNot(same(original)));
    });
  });
}
