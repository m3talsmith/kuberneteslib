import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/quantity.dart';

void main() {
  group('Quantity', () {
    group('CPU quantities', () {
      test('handles decimal CPU quantities', () {
        final quantity = Quantity(0.1);  // 100m
        expect(quantity.value, equals(0.1));
      });

      test('handles millicpu quantities', () {
        final quantity = Quantity.fromString('100m');
        expect(quantity.value, equals(0.1));
      });

      test('handles whole CPU quantities', () {
        final quantity = Quantity(2);
        expect(quantity.value, equals(2.0));
      });
    });

    group('Memory quantities', () {
      test('handles basic byte quantities', () {
        final quantity = Quantity(1024);
        expect(quantity.value, equals(1024));
      });

      test('handles megabyte quantities', () {
        final quantity = Quantity.fromString('1M');
        expect(quantity.value, equals(1000 * 1000));
      });

      test('handles gibibyte quantities', () {
        final quantity = Quantity.fromString('1Gi');
        expect(quantity.value, equals(1024 * 1024 * 1024));
      });

      test('handles terabyte quantities', () {
        final quantity = Quantity.fromString('1T');
        expect(quantity.value, equals(1000 * 1000 * 1000 * 1000));
      });
    });

    group('String conversion', () {
      test('converts to string representation correctly', () {
        expect(Quantity(0.1).toString(), equals('100m'));
        expect(Quantity(1024 * 1024).toString(), equals('1Mi'));
      });

      test('parses string representation correctly', () {
        expect(Quantity.fromString('100m').value, equals(0.1));
        expect(Quantity.fromString('1Mi').value, equals(1024 * 1024));
      });
    });

    group('Comparison operations', () {
      test('compares quantities correctly', () {
        final q1 = Quantity(0.1);
        final q2 = Quantity(0.2);
        expect(q1 < q2, isTrue);
        expect(q2 > q1, isTrue);
        expect(q1 == Quantity(0.1), isTrue);
      });

      test('handles equality correctly', () {
        final q1 = Quantity.fromString('1000m');
        final q2 = Quantity(1);
        expect(q1 == q2, isTrue);
      });
    });

    group('Error handling', () {
      test('throws FormatException for invalid string format', () {
        expect(() => Quantity.fromString('invalid'),
            throwsA(isA<FormatException>()));
      });

      test('throws FormatException for invalid units', () {
        expect(() => Quantity.fromString('1X'),
            throwsA(isA<FormatException>()));
      });
    });
  });
} 