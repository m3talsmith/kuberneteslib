import 'package:json_annotation/json_annotation.dart';

part 'secret_env_source.g.dart';

/// Represents a reference to a Kubernetes Secret for environment variable population.
///
/// SecretEnvSource enables containers to load environment variables from Secrets.
/// Key features include:
/// - Secret reference configuration
/// - Optional secret handling
/// - Environment variable population
/// - Secret data access control
///
/// Common use cases:
/// - Application credentials
/// - API keys management
/// - Configuration secrets
/// - Service authentication
///
/// Example:
/// ```dart
/// final secretEnv = SecretEnvSource()
///   ..name = 'app-secrets'
///   ..optional = true;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/secret/#using-secrets-as-environment-variables)
/// for more details about using secrets as environment variables.
@JsonSerializable()
class SecretEnvSource {
  SecretEnvSource();

  /// Name of the secret in the pod's namespace.
  /// 
  /// The secret being referenced must exist in the same namespace as the pod.
  /// All key-value pairs in the secret will be exposed as environment variables.
  @JsonKey(includeIfNull: false)
  String? name;

  /// Controls whether the secret must exist.
  /// 
  /// When true:
  /// - Missing secrets won't cause an error
  /// - Pod startup continues if secret is not found
  /// When false:
  /// - Missing secrets will prevent pod startup
  /// - Default behavior if not specified
  @JsonKey(includeIfNull: false)
  bool? optional;

  factory SecretEnvSource.fromJson(Map<String, dynamic> json) =>
      _$SecretEnvSourceFromJson(json);

  Map<String, dynamic> toJson() => _$SecretEnvSourceToJson(this);
}
