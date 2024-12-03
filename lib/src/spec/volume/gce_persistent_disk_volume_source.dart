import 'package:json_annotation/json_annotation.dart';

part 'gce_persistent_disk_volume_source.g.dart';

/// Represents a Google Compute Engine (GCE) Persistent Disk volume in Kubernetes.
///
/// GCEPersistentDiskVolumeSource enables pods to use GCE Persistent Disks for
/// storage. Key features include:
/// - Persistent storage across pod restarts
/// - Zone-based availability
/// - Multiple filesystem support
/// - Optional read-only access
///
/// Common use cases:
/// - Database storage
/// - Shared application data
/// - Stateful workloads in GCP
///
/// Example:
/// ```dart
/// final gcePd = GCEPersistentDiskVolumeSource()
///   ..pdName = 'my-database-disk'
///   ..fsType = 'ext4'
///   ..partition = 0
///   ..readOnly = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#gcepersistentdisk)
/// for more details about GCE Persistent Disk volumes.
@JsonSerializable()
class GCEPersistentDiskVolumeSource {
  GCEPersistentDiskVolumeSource();

  /// Filesystem type for mounting the volume.
  /// 
  /// Optional: Defaults to the default filesystem configured on the host.
  /// Must be a filesystem type supported by the host operating system.
  String? fsType;

  /// The partition number on the disk to mount.
  /// 
  /// Optional: If omitted, the default is to mount by volume name.
  /// Examples: For partition /dev/sda1, use 1.
  int? partition;

  /// Unique name of the PD resource in GCE.
  /// 
  /// Required: This is used to identify the disk in GCE.
  /// The volume name must be unique within the zone.
  String? pdName;

  /// Controls read-only access to the volume.
  /// 
  /// Optional: Defaults to false (read/write).
  /// ReadOnly here will force the ReadOnly setting in VolumeMounts.
  bool? readOnly;

  factory GCEPersistentDiskVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$GCEPersistentDiskVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$GCEPersistentDiskVolumeSourceToJson(this);
}
