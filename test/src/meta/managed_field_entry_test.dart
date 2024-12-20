import 'package:test/test.dart';
import 'package:kuberneteslib/src/meta/managed_field_entry.dart';
import 'package:kuberneteslib/src/meta/fields_v1.dart';

void main() {
  group('ManagedFieldEntry', () {
    test('can be instantiated', () {
      final entry = ManagedFieldEntry();

      expect(entry.apiVersion, isNull);
      expect(entry.fieldsType, isNull);
      expect(entry.fieldsV1, isNull);
      expect(entry.manager, isNull);
      expect(entry.operation, isNull);
      expect(entry.subresource, isNull);
      expect(entry.time, isNull);
    });

    test('can be created from JSON', () {
      final json = {
        'apiVersion': 'v1',
        'fieldsType': 'FieldsV1',
        'fieldsV1': {'f:metadata': {}},
        'manager': 'kubectl',
        'operation': 'Update',
        'time': '2023-01-01T00:00:00Z',
      };

      final entry = ManagedFieldEntry.fromJson(json);

      expect(entry.apiVersion, 'v1');
      expect(entry.fieldsType, 'FieldsV1');
      expect(entry.fieldsV1, isA<FieldsV1>());
      expect(entry.manager, 'kubectl');
      expect(entry.operation, 'Update');
      expect(entry.time?.toIso8601String(), '2023-01-01T00:00:00.000Z');
    });

    test('can be converted to JSON', () {
      final entry = ManagedFieldEntry()
        ..apiVersion = 'v1'
        ..fieldsType = 'FieldsV1'
        ..fieldsV1 = FieldsV1()
        ..manager = 'kubectl'
        ..operation = 'Update'
        ..time = DateTime.utc(2023, 1, 1);

      final json = entry.toJson();

      expect(json['apiVersion'], 'v1');
      expect(json['fieldsType'], 'FieldsV1');
      expect(json['fieldsV1'], isA<Map>());
      expect(json['manager'], 'kubectl');
      expect(json['operation'], 'Update');
      expect(json['time'], '2023-01-01T00:00:00.000Z');
    });

    test('subresource is not included in JSON', () {
      final entry = ManagedFieldEntry()
        ..apiVersion = 'v1'
        ..subresource = 'status';

      final json = entry.toJson();

      expect(json.containsKey('subresource'), isFalse);
    });

    test('null fields are excluded from JSON', () {
      final entry = ManagedFieldEntry();
      final json = entry.toJson();

      expect(json.containsKey('apiVersion'), isFalse);
      expect(json.containsKey('fieldsType'), isFalse);
      expect(json.containsKey('fieldsV1'), isFalse);
      expect(json.containsKey('manager'), isFalse);
      expect(json.containsKey('operation'), isFalse);
      expect(json.containsKey('time'), isFalse);
    });
  });
}
