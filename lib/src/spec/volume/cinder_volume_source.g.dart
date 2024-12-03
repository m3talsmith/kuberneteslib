// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinder_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinderVolumeSource _$CinderVolumeSourceFromJson(Map<String, dynamic> json) =>
    CinderVolumeSource()
      ..fsType = json['fsType'] as String
      ..readOnly = json['readOnly'] as bool
      ..secretRef = LocalObjectReference.fromJson(
          json['secretRef'] as Map<String, dynamic>)
      ..volumeID = json['volumeID'] as String;

Map<String, dynamic> _$CinderVolumeSourceToJson(CinderVolumeSource instance) =>
    <String, dynamic>{
      'fsType': instance.fsType,
      'readOnly': instance.readOnly,
      'secretRef': instance.secretRef,
      'volumeID': instance.volumeID,
    };
