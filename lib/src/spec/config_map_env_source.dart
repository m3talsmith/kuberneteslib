import 'package:json_annotation/json_annotation.dart';

part 'config_map_env_source.g.dart';

/// Represents a ConfigMap environment source in Kubernetes.
///
/// ConfigMapEnvSource enables pods to load environment variables from ConfigMaps.
/// Key features include:
/// - Environment variable injection
/// - Configuration decoupling
/// - Optional ConfigMap validation
/// - Dynamic configuration updates
///
/// Common use cases:
/// - Application configuration
/// - Environment-specific settings
/// - Feature flags
/// - Service endpoints
///
/// Example:
/// ```dart
/// final envSource = ConfigMapEnvSource()
///   ..name = 'app-config'
///   ..optional = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/#configure-all-key-value-pairs-in-a-configmap-as-container-environment-variables)
/// for more details about ConfigMap environment variables.
@JsonSerializable()
class ConfigMapEnvSource {
  ConfigMapEnvSource();

  /// The name of the ConfigMap in the pod's namespace.
  /// 
  /// Required: References an existing ConfigMap to load environment variables from.
  /// The ConfigMap must exist in the same namespace as the pod.
  @JsonKey(includeIfNull: false)
  String? name;

  /// Whether the ConfigMap must exist.
  /// 
  /// Optional: Defaults to false. When true, the pod will start even if the
  /// ConfigMap doesn't exist or has missing keys. When false, the container
  /// will fail to start if the ConfigMap is missing or has missing keys.
  @JsonKey(includeIfNull: false)
  bool? optional;

  factory ConfigMapEnvSource.fromJson(Map<String, dynamic> json) =>
      _$ConfigMapEnvSourceFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigMapEnvSourceToJson(this);
}
