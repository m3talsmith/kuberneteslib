// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vsphere_virtual_disk_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VsphereVirtualDiskVolumeSource _$VsphereVirtualDiskVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    VsphereVirtualDiskVolumeSource()
      ..fsType = json['fsType'] as String
      ..storagePolicyID = json['storagePolicyID'] as String
      ..storagePolicyName = json['storagePolicyName'] as String
      ..volumePath = json['volumePath'] as String;

Map<String, dynamic> _$VsphereVirtualDiskVolumeSourceToJson(
        VsphereVirtualDiskVolumeSource instance) =>
    <String, dynamic>{
      'fsType': instance.fsType,
      'storagePolicyID': instance.storagePolicyID,
      'storagePolicyName': instance.storagePolicyName,
      'volumePath': instance.volumePath,
    };
