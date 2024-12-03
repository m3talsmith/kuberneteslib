// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flocker_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlockerVolumeSource _$FlockerVolumeSourceFromJson(Map<String, dynamic> json) =>
    FlockerVolumeSource()
      ..datasetName = json['datasetName'] as String
      ..datasetUUID = json['datasetUUID'] as String;

Map<String, dynamic> _$FlockerVolumeSourceToJson(
        FlockerVolumeSource instance) =>
    <String, dynamic>{
      'datasetName': instance.datasetName,
      'datasetUUID': instance.datasetUUID,
    };
