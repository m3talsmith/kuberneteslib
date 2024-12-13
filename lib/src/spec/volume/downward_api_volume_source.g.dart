// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downward_api_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownwardAPIVolumeSource _$DownwardAPIVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    DownwardAPIVolumeSource(
      defaultMode: _modeFromJson(json['defaultMode']),
      items: _itemsFromJson(json['items'] as List?),
    );

Map<String, dynamic> _$DownwardAPIVolumeSourceToJson(
        DownwardAPIVolumeSource instance) =>
    <String, dynamic>{
      if (_modeToJson(instance.defaultMode) case final value?)
        'defaultMode': value,
      if (_itemsToJson(instance.items) case final value?) 'items': value,
    };
