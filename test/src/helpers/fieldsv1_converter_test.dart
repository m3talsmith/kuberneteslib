import 'package:test/test.dart';
import 'package:kuberneteslib/src/helpers/fieldsv1_converter.dart';
import 'package:kuberneteslib/kuberneteslib.dart';

void main() {
  group('FieldV1Converter', () {
    const converter = FieldV1Converter();

    test('fromJson converts Map to FieldsV1', () {
      final json = {
        'f:spec': {
          '.': {},
          'f:replicas': {},
        }
      };

      final result = converter.fromJson(json);

      expect(result, isA<FieldsV1>());
      expect(result.toJson(), equals(json));
    });

    test('toJson converts FieldsV1 to Map', () {
      final fieldsV1 = FieldsV1(fields: {
        'f:spec': {
          '.': {},
          'f:replicas': {},
        }
      });

      final result = converter.toJson(fieldsV1);

      expect(result, isA<Map<String, dynamic>>());
      expect(result, equals(fieldsV1.fields));
    });
  });
}
