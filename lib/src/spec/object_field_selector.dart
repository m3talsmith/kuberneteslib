/// Represents an ObjectFieldSelector that selects a field of an object in Kubernetes.
/// This is commonly used in downward API volume sources and environment variables.
class ObjectFieldSelector {
  /// The API version of the target object.
  late String apiVersion;

  /// Path of the field to select in the specified API version.
  /// For example: "metadata.name", "metadata.namespace", etc.
  late String fieldPath;

  /// Creates an [ObjectFieldSelector] instance from a map structure.
  /// 
  /// [data] should contain:
  /// - 'apiVersion': The API version of the target object
  /// - 'fieldPath': The path to the desired field
  ObjectFieldSelector.fromMap(Map<String, dynamic> data) {
    apiVersion = data['apiVersion'];
    fieldPath = data['fieldPath'];
  }
}
