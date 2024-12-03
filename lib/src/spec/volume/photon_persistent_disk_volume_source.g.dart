// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photon_persistent_disk_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotonPersistentDiskVolumeSource _$PhotonPersistentDiskVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    PhotonPersistentDiskVolumeSource()
      ..fsType = json['fsType'] as String
      ..pdID = json['pdID'] as String;

Map<String, dynamic> _$PhotonPersistentDiskVolumeSourceToJson(
        PhotonPersistentDiskVolumeSource instance) =>
    <String, dynamic>{
      'fsType': instance.fsType,
      'pdID': instance.pdID,
    };
