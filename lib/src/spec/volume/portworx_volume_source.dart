import 'package:json_annotation/json_annotation.dart';

part 'portworx_volume_source.g.dart';

/// Represents a Portworx volume in Kubernetes for cloud-native storage.
///
/// PortworxVolumeSource enables pods to use Portworx distributed storage.
/// Key features include:
/// - Software-defined storage
/// - High availability
/// - Data encryption
/// - Storage policies
/// - Snapshot support
///
/// Common use cases:
/// - Containerized databases
/// - Stateful applications
/// - High-performance workloads
/// - Multi-cloud deployments
///
/// Example:
/// ```dart
/// final portworxVolume = PortworxVolumeSource()
///   ..volumeID = 'pxd-123'
///   ..fsType = 'ext4'
///   ..readOnly = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#portworxvolume)
/// for more details about Portworx volumes.
@JsonSerializable()
class PortworxVolumeSource {
  PortworxVolumeSource();

  /// The filesystem type to mount.
  /// 
  /// Must be a filesystem type supported by the host operating system.
  /// Common values include: "ext4", "xfs", "ntfs".
  /// Optional: Defaults to "ext4" if unspecified.
  late String fsType;

  /// Controls read-only access to the volume.
  /// 
  /// When true, the volume will be mounted read-only.
  /// When false, the volume will be mounted with read-write permissions.
  /// Optional: Defaults to false.
  late bool readOnly;

  /// Unique identifier for the Portworx volume.
  /// 
  /// Required: This ID must correspond to an existing Portworx volume.
  /// The volume must be created using Portworx before it can be used.
  late String volumeID;

  factory PortworxVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$PortworxVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$PortworxVolumeSourceToJson(this);
}
