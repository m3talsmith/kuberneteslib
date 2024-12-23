import 'package:kuberneteslib/src/spec/quantity.dart';
import 'package:test/test.dart';

void main() {
  group('Quantity', () {
    test('can be null', () {
      const Quantity quantity = null;
      expect(quantity, isNull);
    });

    test('supports decimal CPU values', () {
      Quantity cpuQuantity = '0.5';
      expect(cpuQuantity, equals('0.5'));
    });

    test('supports millicpu values', () {
      Quantity cpuQuantity = '500m';
      expect(cpuQuantity, equals('500m'));
    });

    test('supports memory values with binary suffixes', () {
      Quantity memoryQuantity = '256Mi';
      expect(memoryQuantity, equals('256Mi'));
    });

    test('supports memory values with decimal suffixes', () {
      Quantity memoryQuantity = '1G';
      expect(memoryQuantity, equals('1G'));
    });

    test('supports plain integer values', () {
      Quantity plainQuantity = '1234';
      expect(plainQuantity, equals('1234'));
    });

    test('supports storage values', () {
      Quantity storageQuantity = '10Gi';
      expect(storageQuantity, equals('10Gi'));
    });
  });
}
