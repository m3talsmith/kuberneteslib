import 'config_map_env_source.dart';
import 'secret_env_source.dart';
import 'package:json_annotation/json_annotation.dart';

part 'env_from_source.g.dart';

/// Represents a source for populating environment variables in Kubernetes containers.
///
/// EnvFromSource enables containers to load multiple environment variables from
/// ConfigMaps or Secrets. Key features include:
/// - ConfigMap environment loading
/// - Secret environment loading
/// - Variable name prefixing
/// - Bulk environment configuration
///
/// Common use cases:
/// - Application configuration
/// - Database credentials
/// - API keys and tokens
/// - Service connection strings
///
/// Example:
/// ```dart
/// final envSource = EnvFromSource()
///   ..configMapRef = ConfigMapEnvSource()
///     ..name = 'app-config'
///     ..optional = false
///   ..prefix = 'CONFIG_';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/#configure-all-key-value-pairs-in-a-configmap-as-container-environment-variables)
/// for more details about environment configuration.
@JsonSerializable()
class EnvFromSource {
  EnvFromSource();

  /// Reference to a ConfigMap to load environment variables from.
  /// 
  /// Optional: When specified, all key-value pairs from the referenced ConfigMap
  /// will be added as environment variables to the container.
  @JsonKey(includeIfNull: false)
  ConfigMapEnvSource? configMapRef;

  /// An optional prefix to add to all environment variable names.
  /// 
  /// Optional: When specified, this string will be prepended to all environment
  /// variable names loaded from the ConfigMap or Secret.
  @JsonKey(includeIfNull: false)
  String? prefix;

  /// Reference to a Secret to load environment variables from.
  /// 
  /// Optional: When specified, all key-value pairs from the referenced Secret
  /// will be added as environment variables to the container.
  @JsonKey(includeIfNull: false)
  SecretEnvSource? secretRef;

  factory EnvFromSource.fromJson(Map<String, dynamic> json) =>
      _$EnvFromSourceFromJson(json);

  Map<String, dynamic> toJson() => _$EnvFromSourceToJson(this);
}
