import 'fields_v1.dart';

/// Implements the [ManagedFieldEntry] portion of the specification.
///
/// [Reference](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.28/#managedfieldsentry-v1-meta)
class ManagedFieldEntry {
  /// The API version of the resource being managed.
  late String apiVersion;

  /// The type of fields, typically "FieldsV1".
  late String fieldsType;

  /// The set of fields that were managed by the manager.
  late FieldsV1 fieldsV1;

  /// The name of the manager that created/modified these fields.
  /// This could be a controller name, user name, or other identifier.
  late String manager;

  /// The type of operation that was performed on these fields.
  /// Common values include "Apply", "Update", "Create".
  late String operation;

  /// Optional subresource that was modified, if any.
  /// For example, "status" or "scale".
  String? subresource;

  /// The time when these fields were last modified.
  late DateTime time;

  /// Creates a new [ManagedFieldEntry] instance from a JSON map.
  ///
  /// The [data] parameter should be a Map containing the following keys:
  /// - apiVersion: String
  /// - fieldsType: String
  /// - fieldsV1: FieldsV1
  /// - manager: String
  /// - operation: String
  /// - subresource: String (optional)
  /// - time: String (ISO 8601 format)
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
