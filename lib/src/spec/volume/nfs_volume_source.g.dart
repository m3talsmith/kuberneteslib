// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nfs_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NFSVolumeSource _$NFSVolumeSourceFromJson(Map<String, dynamic> json) =>
    NFSVolumeSource()
      ..path = json['path'] as String
      ..readOnly = json['readOnly'] as bool
      ..server = json['server'] as String;

Map<String, dynamic> _$NFSVolumeSourceToJson(NFSVolumeSource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'readOnly': instance.readOnly,
      'server': instance.server,
    };
