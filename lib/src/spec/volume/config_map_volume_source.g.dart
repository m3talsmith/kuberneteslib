// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_map_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigMapVolumeSource _$ConfigMapVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    ConfigMapVolumeSource()
      ..defaultMode = (json['defaultMode'] as num?)?.toInt()
      ..items = (json['items'] as List<dynamic>?)
          ?.map((e) => KeyToPath.fromJson(e as Map<String, dynamic>))
          .toList()
      ..name = json['name'] as String?
      ..optional = json['optional'] as bool?;

Map<String, dynamic> _$ConfigMapVolumeSourceToJson(
        ConfigMapVolumeSource instance) =>
    <String, dynamic>{
      if (instance.defaultMode case final value?) 'defaultMode': value,
      if (instance.items case final value?) 'items': value,
      if (instance.name case final value?) 'name': value,
      if (instance.optional case final value?) 'optional': value,
    };
