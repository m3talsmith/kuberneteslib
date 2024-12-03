import 'package:json_annotation/json_annotation.dart';

import '../../spec/key_to_path.dart';

part 'secret_volume_source.g.dart';

/// Represents a Secret volume in Kubernetes for sensitive data storage.
///
/// SecretVolumeSource enables pods to access Kubernetes Secrets as files.
/// Key features include:
/// - Secure secret mounting
/// - Configurable file permissions
/// - Optional secret validation
/// - Selective key mounting
///
/// Common use cases:
/// - Application credentials
/// - TLS certificates
/// - API tokens
/// - Configuration secrets
///
/// Example:
/// ```dart
/// final secretVolume = SecretVolumeSource()
///   ..secretName = 'app-credentials'
///   ..defaultMode = 0400
///   ..optional = false
///   ..items = [
///     KeyToPath()
///       ..key = 'username'
///       ..path = 'credentials/user.txt'
///       ..mode = 0400,
///   ];
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#secret)
/// for more details about Secret volumes.
@JsonSerializable()
class SecretVolumeSource {
  SecretVolumeSource();

  /// Default Unix permission mode for secret files.
  /// 
  /// Optional: Defaults to 0644 if not specified.
  /// Must be a value between 0 and 0777.
  /// Can be overridden by individual items' mode settings.
  @JsonKey(includeIfNull: false)
  int? defaultMode;

  /// Mapping of secret keys to specific paths.
  /// 
  /// Optional: If specified, only the listed keys will be projected into the
  /// specified paths. If unspecified, all keys will be mounted using the key
  /// name as the file name.
  @JsonKey(includeIfNull: false)
  List<KeyToPath>? items;

  /// Controls whether the Secret must exist.
  /// 
  /// Optional: Defaults to false.
  /// When true, volume mounting will fail if the secret doesn't exist.
  /// When false, volume will mount successfully even if the secret is missing.
  @JsonKey(includeIfNull: false)
  bool? optional;

  /// Name of the Secret resource.
  /// 
  /// Required: Must be the name of a Secret in the same namespace as the pod.
  /// The Secret must exist for the volume mount to succeed unless optional is true.
  @JsonKey(includeIfNull: false)
  String? secretName;

  factory SecretVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$SecretVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$SecretVolumeSourceToJson(this);
}
