// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'azure_disk_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AzureDiskVolumeSource _$AzureDiskVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    AzureDiskVolumeSource()
      ..cachingMode = json['cachingMode'] as String
      ..diskName = json['diskName'] as String
      ..diskURI = json['diskURI'] as String
      ..fsType = json['fsType'] as String
      ..kind = json['kind'] as String
      ..readOnly = json['readOnly'] as bool;

Map<String, dynamic> _$AzureDiskVolumeSourceToJson(
        AzureDiskVolumeSource instance) =>
    <String, dynamic>{
      'cachingMode': instance.cachingMode,
      'diskName': instance.diskName,
      'diskURI': instance.diskURI,
      'fsType': instance.fsType,
      'kind': instance.kind,
      'readOnly': instance.readOnly,
    };
