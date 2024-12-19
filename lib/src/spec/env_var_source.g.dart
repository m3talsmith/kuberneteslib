// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_var_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnvVarSource _$EnvVarSourceFromJson(Map<String, dynamic> json) => EnvVarSource()
  ..configMapKeyRef =
      _configMapKeyRefFromJson(json['configMapKeyRef'] as Map<String, dynamic>?)
  ..fieldRef = _fieldRefFromJson(json['fieldRef'] as Map<String, dynamic>?)
  ..resourceFieldRef = _resourceFieldRefFromJson(
      json['resourceFieldRef'] as Map<String, dynamic>?)
  ..secretKeyRef =
      _secretKeyRefFromJson(json['secretKeyRef'] as Map<String, dynamic>?);

Map<String, dynamic> _$EnvVarSourceToJson(EnvVarSource instance) =>
    <String, dynamic>{
      if (_configMapKeyRefToJson(instance.configMapKeyRef) case final value?)
        'configMapKeyRef': value,
      if (_fieldRefToJson(instance.fieldRef) case final value?)
        'fieldRef': value,
      if (_resourceFieldRefToJson(instance.resourceFieldRef) case final value?)
        'resourceFieldRef': value,
      if (_secretKeyRefToJson(instance.secretKeyRef) case final value?)
        'secretKeyRef': value,
    };
