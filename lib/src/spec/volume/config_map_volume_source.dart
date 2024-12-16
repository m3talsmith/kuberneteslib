import '../key_to_path.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_map_volume_source.g.dart';

/// Represents a ConfigMap that can be mounted as a volume in Kubernetes pods.
///
/// ConfigMapVolumeSource enables pods to consume ConfigMap data as files in a volume.
/// Key features include:
/// - Custom file permissions via mode bits
/// - Selective key mounting
/// - Optional ConfigMap validation
///
/// Common use cases:
/// - Application configuration files
/// - Environment-specific settings
/// - Certificate and key files
///
/// Example:
/// ```dart
/// final configMapVolume = ConfigMapVolumeSource()
///   ..name = 'app-config'
///   ..defaultMode = 420  // Equivalent to 0644 in octal
///   ..items = [
///     KeyToPath()
///       ..key = 'config.json'
///       ..path = 'app/config.json'
///   ]
///   ..optional = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#configmap)
/// for more details about ConfigMap volumes.
@JsonSerializable()
class ConfigMapVolumeSource {
  ConfigMapVolumeSource();

  /// Optional Unix permission mode bits for created files.
  ///
  /// Must be a value between 0 and 0777 (octal) or 0 and 511 (decimal).
  /// Defaults to 0644 if not specified.
  @JsonKey(includeIfNull: false)
  int? defaultMode;

  /// Optional list of ConfigMap keys to selectively mount.
  ///
  /// Allows mapping specific ConfigMap keys to custom paths in the volume.
  /// If omitted, all keys are mounted at their original names.
  @JsonKey(includeIfNull: false)
  List<KeyToPath>? items;

  /// Name of the ConfigMap to mount.
  ///
  /// Must exist in the same namespace as the pod.
  @JsonKey(includeIfNull: false)
  String? name;

  /// Controls whether the ConfigMap must exist.
  ///
  /// When false, the ConfigMap must exist or pod startup will fail.
  /// When true, a missing ConfigMap is allowed.
  @JsonKey(includeIfNull: false)
  bool? optional;

  factory ConfigMapVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$ConfigMapVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigMapVolumeSourceToJson(this);
}
