/// A class that represents a secret environment source configuration.
/// This is typically used to reference secrets stored in Kubernetes secrets.
class SecretEnvSource {
  /// The name of the secret in the pod's namespace to select from.
  String? name;

  /// Specify whether the Secret must be defined.
  /// When true, the secret is optional and a secret not found in the pod's namespace will not cause an error.
  bool? optional;

  /// Creates a [SecretEnvSource] instance from a map structure.
  ///
  /// [data] should contain:
  /// - 'name': String representing the secret name
  /// - 'optional': bool indicating if the secret is optional
  SecretEnvSource.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    optional = data['optional'];
  }
}
