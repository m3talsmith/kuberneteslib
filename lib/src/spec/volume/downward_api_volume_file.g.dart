// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downward_api_volume_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownwardAPIVolumeFile _$DownwardAPIVolumeFileFromJson(
        Map<String, dynamic> json) =>
    DownwardAPIVolumeFile(
      fieldRef: _fieldRefFromJson(json['fieldRef'] as Map<String, dynamic>?),
      mode: _modeFromJson(json['mode']),
      path: json['path'] as String?,
      resourceFieldRef: _resourceFieldRefFromJson(
          json['resourceFieldRef'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$DownwardAPIVolumeFileToJson(
        DownwardAPIVolumeFile instance) =>
    <String, dynamic>{
      if (_fieldRefToJson(instance.fieldRef) case final value?)
        'fieldRef': value,
      if (_modeToJson(instance.mode) case final value?) 'mode': value,
      if (instance.path case final value?) 'path': value,
      if (_resourceFieldRefToJson(instance.resourceFieldRef) case final value?)
        'resourceFieldRef': value,
    };
