// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ceph_fs_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CephFSVolumeSource _$CephFSVolumeSourceFromJson(Map<String, dynamic> json) =>
    CephFSVolumeSource()
      ..monitors =
          (json['monitors'] as List<dynamic>).map((e) => e as String).toList()
      ..path = json['path'] as String
      ..readOnly = json['readOnly'] as bool
      ..secretFile = json['secretFile'] as String
      ..secretRef = LocalObjectReference.fromJson(
          json['secretRef'] as Map<String, dynamic>)
      ..user = json['user'] as String;

Map<String, dynamic> _$CephFSVolumeSourceToJson(CephFSVolumeSource instance) =>
    <String, dynamic>{
      'monitors': instance.monitors,
      'path': instance.path,
      'readOnly': instance.readOnly,
      'secretFile': instance.secretFile,
      'secretRef': instance.secretRef,
      'user': instance.user,
    };
