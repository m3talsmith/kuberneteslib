/// A reference to a specific object type within a Kubernetes-like API.
///
/// This class holds information about the API group, kind, name, and namespace
/// of the object being referenced.
class TypedObjectReference {
  late String apiGroup;
  late String kind;
  late String name;
  late String namespace;

  /// Creates a [TypedObjectReference] from a map of data.
  ///
  /// The [data] map should contain the following keys:
  /// - `apiGroup`: The API group of the object.
  /// - `kind`: The kind of the object.
  /// - `name`: The name of the object.
  /// - `namespace`: The namespace of the object.
  ///
  /// Example:
  /// ```dart
  /// var reference = TypedObjectReference.fromMap({
  ///   'apiGroup': 'apps',
  ///   'kind': 'Deployment',
  ///   'name': 'nginx-deployment',
  ///   'namespace': 'default'
  /// });
  /// ```
  TypedObjectReference.fromMap(Map<String, dynamic> data) {
    apiGroup = data['apiGroup'];
    kind = data['kind'];
    name = data['name'];
    namespace = data['namespace'];
  }
}
