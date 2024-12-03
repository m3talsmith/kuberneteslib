// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flex_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlexVolumeSource _$FlexVolumeSourceFromJson(Map<String, dynamic> json) =>
    FlexVolumeSource()
      ..driver = json['driver'] as String
      ..fsType = json['fsType'] as String
      ..options = json['options'] as Map<String, dynamic>
      ..readOnly = json['readOnly'] as bool
      ..secretRef = LocalObjectReference.fromJson(
          json['secretRef'] as Map<String, dynamic>);

Map<String, dynamic> _$FlexVolumeSourceToJson(FlexVolumeSource instance) =>
    <String, dynamic>{
      'driver': instance.driver,
      'fsType': instance.fsType,
      'options': instance.options,
      'readOnly': instance.readOnly,
      'secretRef': instance.secretRef,
    };
