// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fc_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FCVolumeSource _$FCVolumeSourceFromJson(Map<String, dynamic> json) =>
    FCVolumeSource()
      ..fsType = json['fsType'] as String
      ..lun = (json['lun'] as num).toInt()
      ..readOnly = json['readOnly'] as bool
      ..targetWWNs =
          (json['targetWWNs'] as List<dynamic>).map((e) => e as String).toList()
      ..wwids =
          (json['wwids'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$FCVolumeSourceToJson(FCVolumeSource instance) =>
    <String, dynamic>{
      'fsType': instance.fsType,
      'lun': instance.lun,
      'readOnly': instance.readOnly,
      'targetWWNs': instance.targetWWNs,
      'wwids': instance.wwids,
    };
