import 'package:json_annotation/json_annotation.dart';

import 'config_map_key_selector.dart';
import 'object_field_selector.dart';
import 'resource_field_selector.dart';
import 'secret_key_selector.dart';

part 'env_var_source.g.dart';

/// Represents a source for individual environment variables in Kubernetes containers.
///
/// EnvVarSource enables containers to populate individual environment variables from
/// various sources. Key features include:
/// - ConfigMap key references
/// - Secret key references
/// - Pod field references
/// - Container resource references
///
/// Common use cases:
/// - Dynamic configuration values
/// - Sensitive credentials
/// - Pod metadata injection
/// - Resource limit references
///
/// Example:
/// ```dart
/// final envVarSource = EnvVarSource()
///   ..configMapKeyRef = ConfigMapKeySelector()
///     ..name = 'app-config'
///     ..key = 'database-url'
///     ..optional = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/)
/// for more details about environment variable configuration.
@JsonSerializable()
class EnvVarSource {
  EnvVarSource();

  /// Reference to a specific key in a ConfigMap.
  /// 
  /// Optional: When specified, the environment variable will take its value from
  /// the referenced key in the ConfigMap.
  @JsonKey(includeIfNull: false)
  ConfigMapKeySelector? configMapKeyRef;

  /// Reference to a field in the pod specification.
  /// 
  /// Optional: When specified, the environment variable will take its value from
  /// the referenced pod field (e.g., metadata.name, status.podIP).
  @JsonKey(includeIfNull: false)
  ObjectFieldSelector? fieldRef;

  /// Reference to a container resource value.
  /// 
  /// Optional: When specified, the environment variable will take its value from
  /// the referenced container resource (e.g., limits.cpu, requests.memory).
  @JsonKey(includeIfNull: false)
  ResourceFieldSelector? resourceFieldRef;

  /// Reference to a specific key in a Secret.
  /// 
  /// Optional: When specified, the environment variable will take its value from
  /// the referenced key in the Secret.
  @JsonKey(includeIfNull: false)
  SecretKeySelector? secretKeyRef;

  factory EnvVarSource.fromJson(Map<String, dynamic> json) =>
      _$EnvVarSourceFromJson(json);
  
  Map<String, dynamic> toJson() => _$EnvVarSourceToJson(this);
}
