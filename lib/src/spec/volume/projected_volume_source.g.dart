// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projected_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectedVolumeSource _$ProjectedVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    ProjectedVolumeSource()
      ..defaultMode = (json['defaultMode'] as num?)?.toInt()
      ..sources = _sourcesFromJson(json['sources'] as List?);

Map<String, dynamic> _$ProjectedVolumeSourceToJson(
        ProjectedVolumeSource instance) =>
    <String, dynamic>{
      if (instance.defaultMode case final value?) 'defaultMode': value,
      if (_sourcesToJson(instance.sources) case final value?) 'sources': value,
    };
