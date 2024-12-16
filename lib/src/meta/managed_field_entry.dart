import 'package:json_annotation/json_annotation.dart';

import '../helpers/fieldsv1_converter.dart';
import 'fields_v1.dart';

part 'managed_field_entry.g.dart';

/// Represents a Kubernetes ManagedFieldsEntry that tracks field ownership and changes.
///
/// ManagedFieldsEntry records information about which fields in an object have been
/// modified by different managers. This is used by the Kubernetes API server to:
/// - Track ownership of fields
/// - Validate field modifications
/// - Prevent conflicts between different controllers or users
///
/// Each entry tracks:
/// - Which manager modified the fields (e.g., controller name, user)
/// - What operation was performed (Apply, Update, Create)
/// - When the modification occurred
/// - Which fields were modified
///
/// Example:
/// ```dart
/// final entry = ManagedFieldEntry()
///   ..apiVersion = 'v1'
///   ..manager = 'kubectl'
///   ..operation = 'Update'
///   ..fieldsType = 'FieldsV1'
///   ..fieldsV1 = FieldsV1()
///   ..time = DateTime.now();
/// ```
///
/// See the [Kubernetes API documentation](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.28/#managedfieldsentry-v1-meta)
/// for more details about managed fields.
@JsonSerializable()
class ManagedFieldEntry {
  /// The API version that the manager used when modifying the object.
  String apiVersion;

  /// The format of the fields data structure.
  /// Currently, this is always "FieldsV1".
  String fieldsType;

  /// The set of fields that were modified by this manager.
  /// Contains a structured description of the fields owned by this manager.
  @FieldV1Converter()
  FieldsV1 fieldsV1;

  /// Identifier of the manager that modified these fields.
  ///
  /// This could be:
  /// - A controller name (e.g., "kube-controller-manager")
  /// - A user name (e.g., "admin")
  /// - A tool identifier (e.g., "kubectl")
  String manager;

  /// The type of operation performed by the manager.
  ///
  /// Common values include:
  /// - "Apply": Fields modified through server-side apply
  /// - "Update": Direct updates to the object
  /// - "Create": Initial object creation
  String operation;

  /// The subresource that was modified, if any.
  ///
  /// Examples:
  /// - "status" for status subresource updates
  /// - "scale" for scaling operations
  @JsonKey(includeFromJson: false)
  String? subresource;

  /// Timestamp when the fields were last modified by this manager.
  DateTime time;

  ManagedFieldEntry()
      : apiVersion = '',
        fieldsType = '',
        fieldsV1 = FieldsV1(),
        manager = '',
        operation = '',
        subresource = '',
        time = DateTime.now();

  factory ManagedFieldEntry.fromJson(Map<String, dynamic> json) =>
      _$ManagedFieldEntryFromJson(json);

  Map<String, dynamic> toJson() => _$ManagedFieldEntryToJson(this);
}
