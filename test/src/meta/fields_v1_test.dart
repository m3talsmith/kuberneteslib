import 'package:test/test.dart';
import 'package:kuberneteslib/src/meta/fields_v1.dart';

void main() {
  group('FieldsV1', () {
    test('creates empty instance', () {
      final fields = FieldsV1();
      expect(fields.toJson(), equals({}));
    });

    test('serializes from JSON correctly', () {
      final json = {
        'f:metadata': {
          'f:labels': {'f:app': {}, 'f:environment': {}}
        }
      };

      final fields = FieldsV1.fromJson(json);
      expect(fields.toJson(), equals(json));
    });

    test('handles complex nested structures', () {
      final json = {
        'f:metadata': {
          'f:labels': {'f:app': {}, 'f:environment': {}}
        },
        'f:spec': {
          'f:containers': {
            'k:{"name":"main"}': {'f:image': {}, 'f:ports': {}}
          }
        }
      };

      final fields = FieldsV1.fromJson(json);
      expect(fields.toJson(), equals(json));
    });
  });
}
