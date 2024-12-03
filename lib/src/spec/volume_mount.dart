import 'package:json_annotation/json_annotation.dart';

part 'volume_mount.g.dart';

/// Represents a volume mount configuration in Kubernetes containers.
///
/// VolumeMount defines how a Volume is mounted into a container's filesystem.
/// Key features include:
/// - Path specification
/// - Mount propagation control
/// - Read/write access management
/// - Subpath mounting
/// - Environment variable expansion
///
/// Common use cases:
/// - Configuration files
/// - Shared data volumes
/// - Persistent storage
/// - Secret mounting
///
/// Example:
/// ```dart
/// final mount = VolumeMount()
///   ..name = 'config-volume'
///   ..mountPath = '/etc/config'
///   ..readOnly = true
///   ..mountPropagation = 'None';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#using-volumes)
/// for more details about volume mounts.
@JsonSerializable()
class VolumeMount {
  VolumeMount();

  /// Path within the container at which the volume should be mounted.
  /// 
  /// Examples:
  /// - '/etc/config'
  /// - '/var/data'
  /// - '/mnt/shared'
  @JsonKey(includeIfNull: false)
  String? mountPath;

  /// Determines how mounts are propagated from the host to container and vice versa.
  /// 
  /// Values:
  /// - 'None': No propagation (default)
  /// - 'HostToContainer': Host changes visible to container
  /// - 'Bidirectional': Changes visible in both directions
  @JsonKey(includeIfNull: false)
  String? mountPropagation;

  /// The name of the volume to mount.
  /// 
  /// Must match a volume name defined in the pod specification.
  @JsonKey(includeIfNull: false)
  String? name;

  /// Controls read/write access to the mounted volume.
  /// 
  /// - true: Read-only access
  /// - false: Read-write access (default)
  @JsonKey(includeIfNull: false)
  bool? readOnly;

  /// Optional relative path within the volume to mount.
  /// 
  /// Allows mounting a specific directory from the volume.
  @JsonKey(includeIfNull: false)
  String? subPath;

  /// Like subPath, but with environment variable expansion.
  /// 
  /// Example: '$(POD_NAME)/config' will expand POD_NAME variable
  @JsonKey(includeIfNull: false)
  String? subPathExpr;

  factory VolumeMount.fromJson(Map<String, dynamic> json) =>
      _$VolumeMountFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeMountToJson(this);
}
