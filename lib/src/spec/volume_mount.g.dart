// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_mount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumeMount _$VolumeMountFromJson(Map<String, dynamic> json) => VolumeMount(
      name: json['name'] as String?,
      mountPath: json['mountPath'] as String?,
      readOnly: json['readOnly'] as bool?,
      subPath: json['subPath'] as String?,
      subPathExpr: json['subPathExpr'] as String?,
    )..mountPropagation = json['mountPropagation'] as String?;

Map<String, dynamic> _$VolumeMountToJson(VolumeMount instance) =>
    <String, dynamic>{
      if (instance.mountPath case final value?) 'mountPath': value,
      if (instance.mountPropagation case final value?)
        'mountPropagation': value,
      if (instance.name case final value?) 'name': value,
      if (instance.readOnly case final value?) 'readOnly': value,
      if (instance.subPath case final value?) 'subPath': value,
      if (instance.subPathExpr case final value?) 'subPathExpr': value,
    };
