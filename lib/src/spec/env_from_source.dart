import 'config_map_env_source.dart';
import 'secret_env_source.dart';

/// Represents a source for environment variables in Kubernetes, which can come from
/// either ConfigMaps or Secrets with an optional prefix.
class EnvFromSource {
  /// Reference to a ConfigMap source for environment variables.
  late ConfigMapEnvSource configMapRef;

  /// Optional prefix to prepend to each environment variable name.
  late String prefix;

  /// Reference to a Secret source for environment variables.
  late SecretEnvSource secretRef;

  /// Creates an [EnvFromSource] instance from a JSON/YAML map.
  /// 
  /// The [data] map should contain:
  /// - 'configMapRef': Map containing ConfigMap reference details
  /// - 'prefix': String to prepend to environment variable names (optional)
  /// - 'secretRef': Map containing Secret reference details
  EnvFromSource.fromMap(Map<String, dynamic> data) {
    configMapRef = ConfigMapEnvSource.fromMap(data['configMapRef']);
    prefix = data['prefix'];
    secretRef = SecretEnvSource.fromMap(data['secretRef']);
  }
}
