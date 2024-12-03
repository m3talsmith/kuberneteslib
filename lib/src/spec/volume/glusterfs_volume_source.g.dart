// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'glusterfs_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlusterfsVolumeSource _$GlusterfsVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    GlusterfsVolumeSource()
      ..endpoint = json['endpoint'] as String
      ..path = json['path'] as String
      ..readOnly = json['readOnly'] as bool;

Map<String, dynamic> _$GlusterfsVolumeSourceToJson(
        GlusterfsVolumeSource instance) =>
    <String, dynamic>{
      'endpoint': instance.endpoint,
      'path': instance.path,
      'readOnly': instance.readOnly,
    };
