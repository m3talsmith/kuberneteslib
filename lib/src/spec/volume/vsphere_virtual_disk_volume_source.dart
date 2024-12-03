import 'package:json_annotation/json_annotation.dart';

part 'vsphere_virtual_disk_volume_source.g.dart';

/// Represents a vSphere Virtual Disk volume in Kubernetes.
///
/// VsphereVirtualDiskVolumeSource enables pods to use VMware vSphere Virtual Disk storage.
/// Key features include:
/// - Virtual disk integration
/// - Storage policy support
/// - Enterprise storage capabilities
/// - VMware infrastructure integration
///
/// Common use cases:
/// - Enterprise applications
/// - Stateful workloads
/// - Legacy application migration
/// - VMware-based deployments
///
/// Example:
/// ```dart
/// final vsphereVolume = VsphereVirtualDiskVolumeSource()
///   ..volumePath = '[DatastoreName] kubevols/test-disk.vmdk'
///   ..fsType = 'ext4'
///   ..storagePolicyName = 'gold'
///   ..storagePolicyID = 'policy-id-123';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#vsphere)
/// for more details about vSphere volumes.
@JsonSerializable()
class VsphereVirtualDiskVolumeSource {
  VsphereVirtualDiskVolumeSource();

  /// The filesystem type to mount.
  /// 
  /// Required: Must be a filesystem type supported by the host operating system.
  /// Common values include 'ext4', 'xfs', etc.
  late String fsType;

  /// The storage policy ID for the virtual disk.
  /// 
  /// Optional: Specifies the unique identifier of the storage policy
  /// to be used for the virtual disk.
  late String storagePolicyID;

  /// The storage policy name for the virtual disk.
  /// 
  /// Optional: Specifies the name of the storage policy
  /// to be used for the virtual disk.
  late String storagePolicyName;

  /// The path to the vSphere Virtual Disk.
  /// 
  /// Required: Specifies the location of the VMDK file.
  /// Format: '[datastore] path/to/disk.vmdk'
  late String volumePath;

  factory VsphereVirtualDiskVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$VsphereVirtualDiskVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$VsphereVirtualDiskVolumeSourceToJson(this);
}
