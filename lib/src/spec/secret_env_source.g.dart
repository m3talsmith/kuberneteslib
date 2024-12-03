// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secret_env_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecretEnvSource _$SecretEnvSourceFromJson(Map<String, dynamic> json) =>
    SecretEnvSource()
      ..name = json['name'] as String?
      ..optional = json['optional'] as bool?;

Map<String, dynamic> _$SecretEnvSourceToJson(SecretEnvSource instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.optional case final value?) 'optional': value,
    };
