// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projected_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectedVolumeSource _$ProjectedVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    ProjectedVolumeSource()
      ..defaultMode = (json['defaultMode'] as num?)?.toInt()
      ..sources = (json['sources'] as List<dynamic>?)
          ?.map((e) => VolumeProjection.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ProjectedVolumeSourceToJson(
        ProjectedVolumeSource instance) =>
    <String, dynamic>{
      if (instance.defaultMode case final value?) 'defaultMode': value,
      if (instance.sources case final value?) 'sources': value,
    };
