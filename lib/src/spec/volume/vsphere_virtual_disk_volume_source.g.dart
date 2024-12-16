// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vsphere_virtual_disk_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VsphereVirtualDiskVolumeSource _$VsphereVirtualDiskVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    VsphereVirtualDiskVolumeSource()
      ..volumePath = json['volumePath'] as String?
      ..fsType = json['fsType'] as String?
      ..storagePolicyName = json['storagePolicyName'] as String?
      ..storagePolicyID = json['storagePolicyID'] as String?;

Map<String, dynamic> _$VsphereVirtualDiskVolumeSourceToJson(
        VsphereVirtualDiskVolumeSource instance) =>
    <String, dynamic>{
      if (instance.volumePath case final value?) 'volumePath': value,
      if (instance.fsType case final value?) 'fsType': value,
      if (instance.storagePolicyName case final value?)
        'storagePolicyName': value,
      if (instance.storagePolicyID case final value?) 'storagePolicyID': value,
    };
