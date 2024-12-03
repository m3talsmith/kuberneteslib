// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_os_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorageOSVolumeSource _$StorageOSVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    StorageOSVolumeSource()
      ..fsType = json['fsType'] as String
      ..readOnly = json['readOnly'] as bool
      ..secretRef = LocalObjectReference.fromJson(
          json['secretRef'] as Map<String, dynamic>)
      ..volumeName = json['volumeName'] as String
      ..volumeNamespace = json['volumeNamespace'] as String;

Map<String, dynamic> _$StorageOSVolumeSourceToJson(
        StorageOSVolumeSource instance) =>
    <String, dynamic>{
      'fsType': instance.fsType,
      'readOnly': instance.readOnly,
      'secretRef': instance.secretRef,
      'volumeName': instance.volumeName,
      'volumeNamespace': instance.volumeNamespace,
    };
