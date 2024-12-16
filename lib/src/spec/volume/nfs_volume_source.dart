import 'package:json_annotation/json_annotation.dart';

part 'nfs_volume_source.g.dart';

/// Represents a Network File System (NFS) volume in Kubernetes.
///
/// NFSVolumeSource enables pods to use NFS shares for storage. Key features include:
/// - Network-attached storage
/// - Cross-platform compatibility
/// - Persistent storage across pod restarts
/// - Multi-pod read/write access
///
/// Common use cases:
/// - Shared application data
/// - Development environments
/// - Content management systems
/// - Media storage
///
/// Example:
/// ```dart
/// final nfsVolume = NFSVolumeSource()
///   ..server = 'nfs.example.com'
///   ..path = '/exports/data'
///   ..readOnly = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#nfs)
/// for more details about NFS volumes.
@JsonSerializable()
class NFSVolumeSource {
  NFSVolumeSource();

  /// The path exported by the NFS server.
  ///
  /// Required: The specific directory or file system that is exported
  /// by the NFS server. Must be an absolute path.
  late String path;

  /// Controls read-only access to the volume.
  ///
  /// When true, the volume will be mounted read-only.
  /// Defaults to false (read/write).
  late bool readOnly;

  /// The hostname or IP address of the NFS server.
  ///
  /// Required: The NFS server that exports the volume.
  /// Example: "nfs.example.com" or "192.168.1.100"
  late String server;

  factory NFSVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$NFSVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$NFSVolumeSourceToJson(this);
}
