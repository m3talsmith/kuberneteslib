// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_from_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnvFromSource _$EnvFromSourceFromJson(Map<String, dynamic> json) =>
    EnvFromSource()
      ..configMapRef = json['configMapRef'] == null
          ? null
          : ConfigMapEnvSource.fromJson(
              json['configMapRef'] as Map<String, dynamic>)
      ..prefix = json['prefix'] as String?
      ..secretRef = json['secretRef'] == null
          ? null
          : SecretEnvSource.fromJson(json['secretRef'] as Map<String, dynamic>);

Map<String, dynamic> _$EnvFromSourceToJson(EnvFromSource instance) =>
    <String, dynamic>{
      if (instance.configMapRef case final value?) 'configMapRef': value,
      if (instance.prefix case final value?) 'prefix': value,
      if (instance.secretRef case final value?) 'secretRef': value,
    };
