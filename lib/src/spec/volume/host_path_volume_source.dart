import 'package:json_annotation/json_annotation.dart';

part 'host_path_volume_source.g.dart';

/// Represents a host path volume in Kubernetes for accessing node filesystem storage.
///
/// HostPathVolumeSource enables pods to use the host node's filesystem for storage.
/// Key features include:
/// - Direct host filesystem access
/// - Persistent storage across pod restarts
/// - Support for various path types (files, directories, devices)
/// - Path existence validation
///
/// Warning: Host path volumes can pose security risks and should be used with caution:
/// - No cross-node persistence
/// - No ownership management
/// - No SELinux relabeling
/// - Potential host system access
///
/// Common use cases:
/// - Node-level storage requirements
/// - System daemon access
/// - Container runtime storage
/// - Development and testing
///
/// Example:
/// ```dart
/// final hostPath = HostPathVolumeSource()
///   ..path = '/var/log'
///   ..type = 'DirectoryOrCreate';
/// ```
///
/// Available type values:
/// - "": Default, legacy hostPath behavior
/// - "DirectoryOrCreate": Create directory if missing
/// - "Directory": Directory must exist
/// - "FileOrCreate": Create file if missing
/// - "File": File must exist
/// - "Socket": Unix socket must exist
/// - "CharDevice": Character device must exist
/// - "BlockDevice": Block device must exist
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#hostpath)
/// for more details about HostPath volumes.
@JsonSerializable()
class HostPathVolumeSource {
  HostPathVolumeSource();

  /// Path on the host that will be mounted into the pod.
  ///
  /// The path must be absolute and if the path is a symlink,
  /// it will follow the link to the real path.
  late String path;

  /// Type for the host path volume.
  ///
  /// Determines validation and creation behavior for the path.
  /// Must be one of: "", "DirectoryOrCreate", "Directory", "FileOrCreate",
  /// "File", "Socket", "CharDevice", or "BlockDevice".
  late String type;

  factory HostPathVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$HostPathVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$HostPathVolumeSourceToJson(this);
}
