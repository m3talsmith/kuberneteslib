// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downward_api_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownwardAPIVolumeSource _$DownwardAPIVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    DownwardAPIVolumeSource()
      ..defaultMode = (json['defaultMode'] as num).toInt()
      ..items = (json['items'] as List<dynamic>)
          .map((e) => DownwardAPIVolumeFile.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DownwardAPIVolumeSourceToJson(
        DownwardAPIVolumeSource instance) =>
    <String, dynamic>{
      'defaultMode': instance.defaultMode,
      'items': instance.items,
    };
