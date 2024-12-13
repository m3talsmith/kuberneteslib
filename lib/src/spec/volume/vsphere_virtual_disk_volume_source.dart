import 'package:json_annotation/json_annotation.dart';

part 'vsphere_virtual_disk_volume_source.g.dart';

/// Represents a vSphere Virtual Disk VMDK Volume in Kubernetes.
@JsonSerializable()
class VsphereVirtualDiskVolumeSource {
  VsphereVirtualDiskVolumeSource();

  /// Path to the VMDK file on vSphere storage.
  @JsonKey(includeIfNull: false)
  String? volumePath;

  /// Filesystem type to mount.
  @JsonKey(includeIfNull: false)
  String? fsType;

  /// Storage Policy name for the disk.
  @JsonKey(includeIfNull: false)
  String? storagePolicyName;

  /// Storage Policy ID for the disk.
  @JsonKey(includeIfNull: false)
  String? storagePolicyID;

  factory VsphereVirtualDiskVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$VsphereVirtualDiskVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$VsphereVirtualDiskVolumeSourceToJson(this);
}
