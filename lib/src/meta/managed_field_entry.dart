import 'fields_v1.dart';

/// Implements the [ManagedFieldEntry] portion of the specification.
///
/// [Reference](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.28/#managedfieldsentry-v1-meta)
class ManagedFieldEntry {
  late String apiVersion;
  late String fieldsType;
  late FieldsV1 fieldsV1;
  late String manager;
  late String operation;
  String? subresource;
  late DateTime time;

  /// Takes a [Map] and pulls out the necessary information.
  ManagedFieldEntry.fromMap(Map<String, dynamic> data) {
    apiVersion = data['apiVersion'];
    fieldsType = data['fieldsType'];
    fieldsV1 = data['fieldsV1'] as FieldsV1;
    manager = data['manager'];
    operation = data['operation'];
    subresource = data['subresource'];
    time = DateTime.parse(data['time']);
  }
}
