// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scale_io_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScaleIOVolumeSource _$ScaleIOVolumeSourceFromJson(Map<String, dynamic> json) =>
    ScaleIOVolumeSource(
      fsType: json['fsType'] as String,
      gateway: json['gateway'] as String,
      protectionDomain: json['protectionDomain'] as String,
      readOnly: json['readOnly'] as bool,
      secretRef: LocalObjectReference.fromJson(
          json['secretRef'] as Map<String, dynamic>),
      sslEnabled: json['sslEnabled'] as bool,
      storageMode: json['storageMode'] as String,
      storagePool: json['storagePool'] as String,
      system: json['system'] as String,
      volumeName: json['volumeName'] as String,
    );

Map<String, dynamic> _$ScaleIOVolumeSourceToJson(
        ScaleIOVolumeSource instance) =>
    <String, dynamic>{
      'fsType': instance.fsType,
      'gateway': instance.gateway,
      'protectionDomain': instance.protectionDomain,
      'readOnly': instance.readOnly,
      'secretRef': instance.secretRef,
      'sslEnabled': instance.sslEnabled,
      'storageMode': instance.storageMode,
      'storagePool': instance.storagePool,
      'system': instance.system,
      'volumeName': instance.volumeName,
    };
