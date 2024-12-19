import 'package:json_annotation/json_annotation.dart';

import 'config_map_key_selector.dart';
import 'object_field_selector.dart';
import 'resource_field_selector.dart';
import 'secret_key_selector.dart';

part 'env_var_source.g.dart';

ConfigMapKeySelector? _configMapKeyRefFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ConfigMapKeySelector.fromJson(json);

Map<String, dynamic>? _configMapKeyRefToJson(ConfigMapKeySelector? instance) =>
    instance?.toJson();

ObjectFieldSelector? _fieldRefFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ObjectFieldSelector.fromJson(json);

Map<String, dynamic>? _fieldRefToJson(ObjectFieldSelector? instance) =>
    instance?.toJson();

ResourceFieldSelector? _resourceFieldRefFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ResourceFieldSelector.fromJson(json);

Map<String, dynamic>? _resourceFieldRefToJson(
        ResourceFieldSelector? instance) =>
    instance?.toJson();

SecretKeySelector? _secretKeyRefFromJson(Map<String, dynamic>? json) =>
    json == null ? null : SecretKeySelector.fromJson(json);

Map<String, dynamic>? _secretKeyRefToJson(SecretKeySelector? instance) =>
    instance?.toJson();

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
  @JsonKey(
      includeIfNull: false,
      fromJson: _configMapKeyRefFromJson,
      toJson: _configMapKeyRefToJson)
  ConfigMapKeySelector? configMapKeyRef;

  /// Reference to a field in the pod specification.
  ///
  /// Optional: When specified, the environment variable will take its value from
  /// the referenced pod field (e.g., metadata.name, status.podIP).
  @JsonKey(
      includeIfNull: false,
      fromJson: _fieldRefFromJson,
      toJson: _fieldRefToJson)
  ObjectFieldSelector? fieldRef;

  /// Reference to a container resource value.
  ///
  /// Optional: When specified, the environment variable will take its value from
  /// the referenced container resource (e.g., limits.cpu, requests.memory).
  @JsonKey(
      includeIfNull: false,
      fromJson: _resourceFieldRefFromJson,
      toJson: _resourceFieldRefToJson)
  ResourceFieldSelector? resourceFieldRef;

  /// Reference to a specific key in a Secret.
  ///
  /// Optional: When specified, the environment variable will take its value from
  /// the referenced key in the Secret.
  @JsonKey(
      includeIfNull: false,
      fromJson: _secretKeyRefFromJson,
      toJson: _secretKeyRefToJson)
  SecretKeySelector? secretKeyRef;

  factory EnvVarSource.fromJson(Map<String, dynamic> json) =>
      _$EnvVarSourceFromJson(json);

  Map<String, dynamic> toJson() => _$EnvVarSourceToJson(this);
}
