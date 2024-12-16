import 'package:json_annotation/json_annotation.dart';

import 'projection/config_map_projection.dart';
import 'projection/downward_api_projection.dart';
import 'projection/secret_projection.dart';
import 'projection/service_account_token_projection.dart';

part 'volume_projection.g.dart';

Map<String, dynamic>? _configMapToJson(ConfigMapProjection? ref) =>
    ref?.toJson();

ConfigMapProjection? _configMapFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ConfigMapProjection.fromJson(json);

Map<String, dynamic>? _downwardAPIToJson(DownwardAPIProjection? ref) =>
    ref?.toJson();

DownwardAPIProjection? _downwardAPIFromJson(Map<String, dynamic>? json) =>
    json == null ? null : DownwardAPIProjection.fromJson(json);

Map<String, dynamic>? _secretToJson(SecretProjection? ref) => ref?.toJson();

SecretProjection? _secretFromJson(Map<String, dynamic>? json) =>
    json == null ? null : SecretProjection.fromJson(json);

Map<String, dynamic>? _serviceAccountTokenToJson(
        ServiceAccountTokenProjection? ref) =>
    ref?.toJson();

ServiceAccountTokenProjection? _serviceAccountTokenFromJson(
        Map<String, dynamic>? json) =>
    json == null ? null : ServiceAccountTokenProjection.fromJson(json);

/// Represents a volume projection configuration in Kubernetes.
///
/// VolumeProjection enables combining multiple volume sources into a single directory.
/// Key features include:
/// - Multiple source types
/// - Flexible configuration
/// - Dynamic updates
/// - Secure credentials handling
///
/// Supported projection types:
/// - ConfigMap: Project specific keys from a ConfigMap
/// - Downward API: Project pod and container information
/// - Secret: Project sensitive data from Secrets
/// - ServiceAccount: Project service account tokens
///
/// Example:
/// ```dart
/// final projection = VolumeProjection()
///   ..configMap = ConfigMapProjection()
///     ..name = 'app-config'
///     ..items = [
///       KeyToPath()
///         ..key = 'config.json'
///         ..path = 'config/app.json'
///     ]
///   ..secret = SecretProjection()
///     ..name = 'app-secrets'
///     ..items = [
///       KeyToPath()
///         ..key = 'api-key'
///         ..path = 'secrets/api-key'
///     ];
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/projected-volumes/)
/// for more details about volume projections.
@JsonSerializable()
class VolumeProjection {
  VolumeProjection();

  /// ConfigMap projection configuration.
  ///
  /// Optional: Projects specific keys from a ConfigMap into the volume.
  /// Commonly used for application configuration files.
  @JsonKey(
      includeIfNull: false,
      toJson: _configMapToJson,
      fromJson: _configMapFromJson)
  ConfigMapProjection? configMap;

  /// Downward API projection configuration.
  ///
  /// Optional: Projects pod and container information into the volume.
  /// Useful for accessing metadata about the running pod.
  @JsonKey(
      includeIfNull: false,
      toJson: _downwardAPIToJson,
      fromJson: _downwardAPIFromJson)
  DownwardAPIProjection? downwardAPI;

  /// Secret projection configuration.
  ///
  /// Optional: Projects sensitive data from a Secret into the volume.
  /// Commonly used for credentials and certificates.
  @JsonKey(
      includeIfNull: false, toJson: _secretToJson, fromJson: _secretFromJson)
  SecretProjection? secret;

  /// ServiceAccount token projection configuration.
  ///
  /// Optional: Projects a service account token into the volume.
  /// Used for authenticating with the Kubernetes API.
  @JsonKey(
      includeIfNull: false,
      toJson: _serviceAccountTokenToJson,
      fromJson: _serviceAccountTokenFromJson)
  ServiceAccountTokenProjection? serviceAccountToken;

  factory VolumeProjection.fromJson(Map<String, dynamic> json) =>
      _$VolumeProjectionFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeProjectionToJson(this);
}
