// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_dir_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyDirVolumeSource _$EmptyDirVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    EmptyDirVolumeSource()
      ..medium = json['medium'] as String?
      ..sizeLimit = json['sizeLimit'] as String?;

Map<String, dynamic> _$EmptyDirVolumeSourceToJson(
        EmptyDirVolumeSource instance) =>
    <String, dynamic>{
      'medium': instance.medium,
      'sizeLimit': instance.sizeLimit,
    };
