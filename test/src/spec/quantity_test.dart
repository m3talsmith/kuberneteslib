import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/quantity.dart';

void main() {
  group('Quantity', () {
    test('can be null', () {
      Quantity quantity;
      quantity = null;
      expect(quantity, isNull);
    });

    test('accepts valid CPU formats', () {
      Quantity quantity;
      
      quantity = '100m';  // 100 millicpu
      expect(quantity, equals('100m'));
      
      quantity = '0.5';   // 500 millicpu
      expect(quantity, equals('0.5'));
      
      quantity = '2';     // 2 CPU cores
      expect(quantity, equals('2'));
    });

    test('accepts valid memory formats', () {
      Quantity quantity;
      
      quantity = '256Mi';  // Mebibytes
      expect(quantity, equals('256Mi'));
      
      quantity = '1Gi';    // Gibibytes
      expect(quantity, equals('1Gi'));
      
      quantity = '512';    // Bytes
      expect(quantity, equals('512'));
    });

    test('accepts valid storage formats', () {
      Quantity quantity;
      
      quantity = '10Gi';   // Gibibytes
      expect(quantity, equals('10Gi'));
      
      quantity = '100M';   // Megabytes
      expect(quantity, equals('100M'));
      
      quantity = '1Ti';    // Tebibytes
      expect(quantity, equals('1Ti'));
    });
  });
} 