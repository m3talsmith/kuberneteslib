// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'azure_file_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AzureFileVolumeSource _$AzureFileVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    AzureFileVolumeSource()
      ..readOnly = json['readOnly'] as bool
      ..secretName = json['secretName'] as String
      ..shareName = json['shareName'] as String;

Map<String, dynamic> _$AzureFileVolumeSourceToJson(
        AzureFileVolumeSource instance) =>
    <String, dynamic>{
      'readOnly': instance.readOnly,
      'secretName': instance.secretName,
      'shareName': instance.shareName,
    };
