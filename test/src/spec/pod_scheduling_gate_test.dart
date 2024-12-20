import 'package:kuberneteslib/src/spec/pod_scheduling_gate.dart';
import 'package:test/test.dart';

void main() {
  group('PodSchedulingGate', () {
    test('can be instantiated', () {
      final gate = PodSchedulingGate();
      expect(gate, isNotNull);
      expect(gate.name, isNull);
    });

    test('can be instantiated with a name', () {
      final gate = PodSchedulingGate()..name = 'infrastructure-ready';
      expect(gate.name, equals('infrastructure-ready'));
    });

    group('JSON serialization', () {
      test('toJson produces correct JSON with name', () {
        final gate = PodSchedulingGate()..name = 'infrastructure-ready';
        final json = gate.toJson();

        expect(json, {
          'name': 'infrastructure-ready',
        });
      });

      test('toJson excludes null name', () {
        final gate = PodSchedulingGate();
        final json = gate.toJson();

        expect(json, isEmpty);
      });

      test('fromJson creates correct instance', () {
        final json = {'name': 'infrastructure-ready'};
        final gate = PodSchedulingGate.fromJson(json);

        expect(gate.name, equals('infrastructure-ready'));
      });

      test('fromJson handles missing name', () {
        final json = <String, dynamic>{};
        final gate = PodSchedulingGate.fromJson(json);

        expect(gate.name, isNull);
      });
    });
  });
}
