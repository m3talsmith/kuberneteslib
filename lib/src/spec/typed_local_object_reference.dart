/// A reference to a local Kubernetes object with type information.
/// 
/// This class represents a reference to an object within the same namespace,
/// including its API group, kind, and name.
class TypedLocalObjectReference {
  /// The group this resource belongs to.
  /// For example: "apps", "batch", or "extensions".
  late String apiGroup;

  /// The kind of the referenced resource.
  /// For example: "Deployment", "StatefulSet", "Job".
  late String kind;

  /// The name of the referenced resource.
  late String name;

  /// Creates a [TypedLocalObjectReference] from a map structure.
  /// 
  /// The map must contain the following keys:
  /// - 'apiGroup': The API group of the referenced resource
  /// - 'kind': The kind of the referenced resource
  /// - 'name': The name of the referenced resource
  TypedLocalObjectReference.fromMap(Map<String, dynamic> data) {
    apiGroup = data['apiGroup'];
    kind = data['kind'];
    name = data['name'];
  }
}
