// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'csi_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CSIVolumeSource _$CSIVolumeSourceFromJson(Map<String, dynamic> json) =>
    CSIVolumeSource(
      driver: json['driver'] as String?,
      fsType: json['fsType'] as String?,
      nodePublishSecretRef: _secretRefFromJson(
          json['nodePublishSecretRef'] as Map<String, dynamic>?),
      readOnly: json['readOnly'] as bool? ?? false,
      volumeAttributes: json['volumeAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CSIVolumeSourceToJson(CSIVolumeSource instance) =>
    <String, dynamic>{
      'driver': instance.driver,
      if (instance.fsType case final value?) 'fsType': value,
      if (_secretRefToJson(instance.nodePublishSecretRef) case final value?)
        'nodePublishSecretRef': value,
      if (instance.readOnly case final value?) 'readOnly': value,
      if (instance.volumeAttributes case final value?)
        'volumeAttributes': value,
    };
