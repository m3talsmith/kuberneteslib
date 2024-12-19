// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_from_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnvFromSource _$EnvFromSourceFromJson(Map<String, dynamic> json) =>
    EnvFromSource()
      ..configMapRef =
          _configMapRefFromJson(json['configMapRef'] as Map<String, dynamic>?)
      ..prefix = json['prefix'] as String?
      ..secretRef =
          _secretRefFromJson(json['secretRef'] as Map<String, dynamic>?);

Map<String, dynamic> _$EnvFromSourceToJson(EnvFromSource instance) =>
    <String, dynamic>{
      if (_configMapRefToJson(instance.configMapRef) case final value?)
        'configMapRef': value,
      if (instance.prefix case final value?) 'prefix': value,
      if (_secretRefToJson(instance.secretRef) case final value?)
        'secretRef': value,
    };
