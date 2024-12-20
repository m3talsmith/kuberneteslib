import 'package:kuberneteslib/src/spec/pod_readiness_gate.dart';
import 'package:test/test.dart';

void main() {
  group('PodReadinessGate', () {
    test('can be instantiated', () {
      final gate = PodReadinessGate();
      expect(gate, isNotNull);
      expect(gate.conditionType, isNull);
    });

    test('can be instantiated with conditionType', () {
      final gate = PodReadinessGate()..conditionType = 'custom.io/app-ready';
      expect(gate.conditionType, equals('custom.io/app-ready'));
    });

    group('fromJson', () {
      test('can be created from JSON', () {
        final json = {'conditionType': 'custom.io/app-ready'};
        final gate = PodReadinessGate.fromJson(json);
        expect(gate.conditionType, equals('custom.io/app-ready'));
      });

      test('handles null conditionType', () {
        final json = <String, dynamic>{};
        final gate = PodReadinessGate.fromJson(json);
        expect(gate.conditionType, isNull);
      });
    });

    group('toJson', () {
      test('can be converted to JSON', () {
        final gate = PodReadinessGate()..conditionType = 'custom.io/app-ready';
        final json = gate.toJson();
        expect(json, equals({'conditionType': 'custom.io/app-ready'}));
      });

      test('excludes null conditionType', () {
        final gate = PodReadinessGate();
        final json = gate.toJson();
        expect(json, isEmpty);
      });
    });
  });
}
