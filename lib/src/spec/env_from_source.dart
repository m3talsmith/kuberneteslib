import 'config_map_env_source.dart';
import 'secret_env_source.dart';

/// Represents a source for environment variables in Kubernetes, which can come from
/// either ConfigMaps or Secrets with an optional prefix.
class EnvFromSource {
  /// Reference to a ConfigMap source for environment variables.
  ConfigMapEnvSource? configMapRef;

  /// Optional prefix to prepend to each environment variable name.
  String? prefix;

  /// Reference to a Secret source for environment variables.
  SecretEnvSource? secretRef;

  /// Creates an [EnvFromSource] instance from a JSON/YAML map.
  ///
  /// The [data] map should contain:
  /// - 'configMapRef': Map containing ConfigMap reference details
  /// - 'prefix': String to prepend to environment variable names (optional)
  /// - 'secretRef': Map containing Secret reference details
  EnvFromSource.fromMap(Map<String, dynamic> data) {
    if (data['configMapRef'] != null) {
      configMapRef = ConfigMapEnvSource.fromMap(data['configMapRef']);
    }
    prefix = data['prefix'];
    if (data['secretRef'] != null) {
      secretRef = SecretEnvSource.fromMap(data['secretRef']);
    }
  }

  Map<String, dynamic> toMap() => {
        'configMapRef': (configMapRef != null) ? configMapRef!.toMap() : null,
        'prefix': prefix,
        'secretRef': (secretRef != null) ? secretRef!.toMap() : null,
      }..removeWhere(
          (key, value) => value == null,
        );
}
