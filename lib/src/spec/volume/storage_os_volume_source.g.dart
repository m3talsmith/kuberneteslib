// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_os_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorageOSVolumeSource _$StorageOSVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    StorageOSVolumeSource()
      ..fsType = json['fsType'] as String?
      ..readOnly = json['readOnly'] as bool?
      ..secretRef =
          _secretRefFromJson(json['secretRef'] as Map<String, dynamic>?)
      ..volumeName = json['volumeName'] as String?
      ..volumeNamespace = json['volumeNamespace'] as String?;

Map<String, dynamic> _$StorageOSVolumeSourceToJson(
        StorageOSVolumeSource instance) =>
    <String, dynamic>{
      if (instance.fsType case final value?) 'fsType': value,
      if (instance.readOnly case final value?) 'readOnly': value,
      if (_secretRefToJson(instance.secretRef) case final value?)
        'secretRef': value,
      if (instance.volumeName case final value?) 'volumeName': value,
      if (instance.volumeNamespace case final value?) 'volumeNamespace': value,
    };
