/// A selector for retrieving a specific key from a ConfigMap in Kubernetes.
///
/// This class represents a reference to a specific key within a ConfigMap resource,
/// allowing you to specify which ConfigMap and which key within it should be accessed.
class ConfigMapKeySelector {
  /// The key to select from the ConfigMap.
  late String key;

  /// The name of the ConfigMap resource.
  late String name;

  /// Whether the ConfigMap or key must be defined.
  ///
  /// If true, the volume mount will fail if the referenced ConfigMap or key
  /// does not exist. If false, the volume mount will succeed but with an empty value.
  late bool optional;

  /// Creates a [ConfigMapKeySelector] from a Map representation.
  ///
  /// [data] should contain the following keys:
  /// - 'key': The key to select from the ConfigMap
  /// - 'name': The name of the ConfigMap
  /// - 'optional': Whether the ConfigMap or key is optional
  ConfigMapKeySelector.fromMap(Map<String, dynamic> data) {
    key = data['key'];
    name = data['name'];
    optional = data['optional'];
  }

  Map<String, dynamic> toMap() => {
        'key': key,
        'name': name,
        'optional': optional,
      };
}
