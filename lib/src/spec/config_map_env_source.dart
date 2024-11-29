/// Represents a ConfigMap environment source configuration in Kubernetes.
///
/// A ConfigMap allows you to decouple configuration artifacts from image content
/// to keep containerized applications portable. This class specifically handles
/// the configuration for loading environment variables from a ConfigMap.
///
/// Example:
/// ```dart
/// final configMapEnvSource = ConfigMapEnvSource.fromMap({
///   'name': 'my-config',
///   'optional': true
/// });
/// ```
class ConfigMapEnvSource {
  /// The name of the ConfigMap in the Kubernetes cluster.
  ///
  /// This must match the name of an existing ConfigMap in the same namespace
  /// as the Pod (unless [optional] is true).
  String? name;

  /// Specifies whether the referenced ConfigMap is optional.
  ///
  /// If set to `true`:
  /// - The container will start even if the ConfigMap doesn't exist
  /// - Missing values will be ignored
  ///
  /// If set to `false`:
  /// - The container will fail to start if the ConfigMap is missing
  /// - This is the default behavior if not specified
  bool? optional;

  /// Creates a new [ConfigMapEnvSource] instance from a map of values.
  ///
  /// Parameters:
  ///   - [data]: A map containing the configuration values with the following keys:
  ///     - 'name': (String) The name of the ConfigMap
  ///     - 'optional': (bool) Whether the ConfigMap is optional
  ///
  /// Throws:
  ///   - [TypeError] if the provided values are of incorrect type
  ///   - [ArgumentError] if required fields are missing
  ConfigMapEnvSource.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    optional = data['optional'];
  }
}
