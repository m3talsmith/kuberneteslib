import 'package:json_annotation/json_annotation.dart';

part 'photon_persistent_disk_volume_source.g.dart';

/// Represents a VMware Photon Controller persistent disk volume in Kubernetes.
///
/// PhotonPersistentDiskVolumeSource enables pods to use VMware Photon Platform's
/// persistent disk storage. Key features include:
/// - Persistent block storage
/// - Cross-pod data sharing
/// - VMware platform integration
/// - Filesystem type selection
///
/// Common use cases:
/// - VMware-based deployments
/// - Persistent application storage
/// - Database volumes
/// - Stateful workloads
///
/// Example:
/// ```dart
/// final photonDisk = PhotonPersistentDiskVolumeSource()
///   ..pdID = 'disk-123456'
///   ..fsType = 'ext4';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#photon)
/// for more details about Photon persistent disk volumes.
@JsonSerializable()
class PhotonPersistentDiskVolumeSource {
  PhotonPersistentDiskVolumeSource();

  /// The filesystem type to mount.
  ///
  /// Must be a filesystem type supported by the host operating system.
  /// Examples: "ext4", "xfs", "ntfs".
  ///
  /// Optional: If not specified, the default filesystem type
  /// configured in the Kubernetes cluster will be used.
  late String fsType;

  /// ID that identifies the Photon Controller persistent disk.
  ///
  /// Required: This ID must correspond to an existing persistent disk resource
  /// in the Photon Platform. The disk must be created before it can be used
  /// as a volume source.
  late String pdID;

  factory PhotonPersistentDiskVolumeSource.fromJson(
          Map<String, dynamic> json) =>
      _$PhotonPersistentDiskVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PhotonPersistentDiskVolumeSourceToJson(this);
}
