// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_map_env_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigMapEnvSource _$ConfigMapEnvSourceFromJson(Map<String, dynamic> json) =>
    ConfigMapEnvSource()
      ..name = json['name'] as String?
      ..optional = json['optional'] as bool?;

Map<String, dynamic> _$ConfigMapEnvSourceToJson(ConfigMapEnvSource instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.optional case final value?) 'optional': value,
    };
