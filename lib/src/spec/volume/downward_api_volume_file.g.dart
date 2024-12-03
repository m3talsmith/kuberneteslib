// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downward_api_volume_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownwardAPIVolumeFile _$DownwardAPIVolumeFileFromJson(
        Map<String, dynamic> json) =>
    DownwardAPIVolumeFile()
      ..fieldRef = json['fieldRef'] == null
          ? null
          : ObjectFieldSelector.fromJson(
              json['fieldRef'] as Map<String, dynamic>)
      ..mode = (json['mode'] as num?)?.toInt()
      ..path = json['path'] as String?
      ..resourceFieldRef = json['resourceFieldRef'] == null
          ? null
          : ResourceFieldSelector.fromJson(
              json['resourceFieldRef'] as Map<String, dynamic>);

Map<String, dynamic> _$DownwardAPIVolumeFileToJson(
        DownwardAPIVolumeFile instance) =>
    <String, dynamic>{
      if (instance.fieldRef case final value?) 'fieldRef': value,
      if (instance.mode case final value?) 'mode': value,
      if (instance.path case final value?) 'path': value,
      if (instance.resourceFieldRef case final value?)
        'resourceFieldRef': value,
    };
