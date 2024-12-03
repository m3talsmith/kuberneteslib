// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'csi_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CSIVolumeSource _$CSIVolumeSourceFromJson(Map<String, dynamic> json) =>
    CSIVolumeSource()
      ..driver = json['driver'] as String
      ..fsType = json['fsType'] as String
      ..nodePublishSecretRef = LocalObjectReference.fromJson(
          json['nodePublishSecretRef'] as Map<String, dynamic>)
      ..readOnly = json['readOnly'] as bool
      ..volumeAttributes = json['volumeAttributes'] as Map<String, dynamic>;

Map<String, dynamic> _$CSIVolumeSourceToJson(CSIVolumeSource instance) =>
    <String, dynamic>{
      'driver': instance.driver,
      'fsType': instance.fsType,
      'nodePublishSecretRef': instance.nodePublishSecretRef,
      'readOnly': instance.readOnly,
      'volumeAttributes': instance.volumeAttributes,
    };
