import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:kuberneteslib/src/helpers/uint8list_converter.dart';

void main() {
  const converter = Uint8ListConverter();

  group('Uint8ListConverter', () {
    test('fromJson should convert String to Uint8List', () {
      const testString = 'Hello, World!';
      final result = converter.fromJson(testString);

      expect(result, isA<Uint8List>());
      expect(result.length, equals(13)); // Length of 'Hello, World!'
    });

    test('toJson should convert Uint8List back to String', () {
      const testString = 'Hello, World!';
      final uint8List = Uint8List.fromList(testString.codeUnits);

      final result = converter.toJson(uint8List);

      expect(result, equals(testString));
    });

    test('roundtrip conversion should preserve data', () {
      const originalString = 'Test with special chars: áéíóú 你好';

      final uint8List = converter.fromJson(originalString);
      final resultString = converter.toJson(uint8List);

      expect(resultString, equals(originalString));
    });

    test('should handle empty string', () {
      const emptyString = '';

      final uint8List = converter.fromJson(emptyString);
      final resultString = converter.toJson(uint8List);

      expect(uint8List.length, equals(0));
      expect(resultString, equals(emptyString));
    });
  });
}
