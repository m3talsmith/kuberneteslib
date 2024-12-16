/// Represents a Kubernetes FieldsV1 type that tracks managed fields in objects.
///
/// FieldsV1 is used by the Kubernetes API server to track which fields in an object
/// have been modified by different managers (e.g., controllers, users, or other processes).
/// This tracking enables:
///
/// - Server-side field validation
/// - Strategic merge patch operations
/// - Conflict detection during updates
///
/// The structure is a map where:
/// - Keys are field paths using standard Kubernetes dot notation
/// - Values represent the field state or contents
///
/// Example usage:
/// ```dart
/// final fields = FieldsV1()..toJson() = {
///   'f:metadata': {
///     'f:labels': {
///       'f:app': {},
///       'f:environment': {}
///     }
///   },
///   'f:spec': {
///     'f:containers': {
///       'k:{"name":"main"}': {
///         'f:image': {},
///         'f:ports': {}
///       }
///     }
///   }
/// };
/// ```
///
/// Field paths follow these conventions:
/// - 'f:' prefix for object fields
/// - 'k:' prefix for map keys
/// - 'v:' prefix for array values
/// - Array indices in square brackets
///
/// See the [Kubernetes API documentation](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.28/#fieldsv1-v1-meta)
/// for more details about field management.
class FieldsV1 {
  FieldsV1({this.fields = const {}});

  Map<String, dynamic> fields;

  factory FieldsV1.fromJson(Map<String, dynamic> json) {
    final fields = <String, dynamic>{};
    for (var entry in json.entries) {
      fields[entry.key] = entry.value;
    }
    return FieldsV1(fields: fields);
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    for (var entry in fields.entries) {
      json[entry.key] = entry.value;
    }
    return json;
  }
}
