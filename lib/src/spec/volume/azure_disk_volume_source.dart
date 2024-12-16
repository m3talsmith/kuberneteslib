import 'package:json_annotation/json_annotation.dart';

part 'azure_disk_volume_source.g.dart';

/// Represents an Azure Disk that can be mounted as a volume in Kubernetes.
///
/// AzureDiskVolumeSource enables pods to use Azure Managed Disks or VHDs for
/// persistent storage. Key features include:
/// - Support for different caching modes
/// - Multiple disk kinds (Managed, Shared, Dedicated)
/// - Various filesystem types
///
/// Common use cases:
/// - Database storage
/// - Stateful applications
/// - High-performance workloads
///
/// Example:
/// ```dart
/// final azureDisk = AzureDiskVolumeSource()
///   ..diskName = 'my-azure-disk'
///   ..diskURI = '/subscriptions/.../disks/my-azure-disk'
///   ..cachingMode = 'ReadWrite'
///   ..fsType = 'ext4'
///   ..kind = 'Managed'
///   ..readOnly = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#azuredisk)
/// for more details about Azure Disk volumes.
@JsonSerializable()
class AzureDiskVolumeSource {
  AzureDiskVolumeSource();

  /// Host caching mode for the disk.
  ///
  /// Possible values:
  /// - 'None': No caching
  /// - 'ReadOnly': Read-only caching
  /// - 'ReadWrite': Read-write caching
  late String cachingMode;

  /// Name of the Azure Data Disk.
  ///
  /// This must match the disk name in the Azure portal or CLI.
  late String diskName;

  /// The URI the data disk in the Azure environment.
  ///
  /// Format: '/subscriptions/{sub-id}/resourcegroups/{group-name}/...'
  late String diskURI;

  /// The filesystem type to mount.
  ///
  /// Must be a filesystem type supported by the host operating system.
  /// Common values: 'ext4', 'xfs', 'ntfs'
  late String fsType;

  /// The type of Azure Data Disk to use.
  ///
  /// Possible values:
  /// - 'Shared': multiple VMs can share the disk
  /// - 'Dedicated': single VM access
  /// - 'Managed': Azure managed disk
  late String kind;

  /// Forces the volume to be mounted read-only.
  ///
  /// When true, the disk will be mounted with read-only access.
  /// Defaults to false (read/write).
  late bool readOnly;

  factory AzureDiskVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$AzureDiskVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$AzureDiskVolumeSourceToJson(this);
}
