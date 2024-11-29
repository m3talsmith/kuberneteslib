/// FieldsV1 represents a set of fields in Kubernetes objects that tracks changes
/// made to that object. It's used primarily for server-side field validation and
/// strategic merge patch operations.
///
/// The structure is a map where:
/// - Keys are field paths (e.g., "spec.containers[0].image")
/// - Values can be any JSON-compatible value representing the field state
///
/// Example:
/// ```dart
/// final fields = <String, dynamic>{
///   'spec.containers[0].image': 'nginx:1.14.2',
///   'metadata.labels': {'app': 'nginx'}
/// };
/// ```
///
/// [Reference](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.28/#fieldsv1-v1-meta)
typedef FieldsV1 = Map<String, dynamic>;
