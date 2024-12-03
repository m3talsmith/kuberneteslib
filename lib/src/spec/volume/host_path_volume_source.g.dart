// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_path_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostPathVolumeSource _$HostPathVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    HostPathVolumeSource()
      ..path = json['path'] as String
      ..type = json['type'] as String;

Map<String, dynamic> _$HostPathVolumeSourceToJson(
        HostPathVolumeSource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'type': instance.type,
    };
