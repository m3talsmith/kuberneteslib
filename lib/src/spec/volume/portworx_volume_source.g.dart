// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portworx_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortworxVolumeSource _$PortworxVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    PortworxVolumeSource()
      ..fsType = json['fsType'] as String
      ..readOnly = json['readOnly'] as bool
      ..volumeID = json['volumeID'] as String;

Map<String, dynamic> _$PortworxVolumeSourceToJson(
        PortworxVolumeSource instance) =>
    <String, dynamic>{
      'fsType': instance.fsType,
      'readOnly': instance.readOnly,
      'volumeID': instance.volumeID,
    };
