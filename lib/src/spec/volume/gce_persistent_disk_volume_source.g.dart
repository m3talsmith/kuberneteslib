// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gce_persistent_disk_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GCEPersistentDiskVolumeSource _$GCEPersistentDiskVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    GCEPersistentDiskVolumeSource()
      ..fsType = json['fsType'] as String?
      ..partition = (json['partition'] as num?)?.toInt()
      ..pdName = json['pdName'] as String?
      ..readOnly = json['readOnly'] as bool?;

Map<String, dynamic> _$GCEPersistentDiskVolumeSourceToJson(
        GCEPersistentDiskVolumeSource instance) =>
    <String, dynamic>{
      'fsType': instance.fsType,
      'partition': instance.partition,
      'pdName': instance.pdName,
      'readOnly': instance.readOnly,
    };
