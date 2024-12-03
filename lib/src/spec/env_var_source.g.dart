// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_var_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnvVarSource _$EnvVarSourceFromJson(Map<String, dynamic> json) => EnvVarSource()
  ..configMapKeyRef = json['configMapKeyRef'] == null
      ? null
      : ConfigMapKeySelector.fromJson(
          json['configMapKeyRef'] as Map<String, dynamic>)
  ..fieldRef = json['fieldRef'] == null
      ? null
      : ObjectFieldSelector.fromJson(json['fieldRef'] as Map<String, dynamic>)
  ..resourceFieldRef = json['resourceFieldRef'] == null
      ? null
      : ResourceFieldSelector.fromJson(
          json['resourceFieldRef'] as Map<String, dynamic>)
  ..secretKeyRef = json['secretKeyRef'] == null
      ? null
      : SecretKeySelector.fromJson(
          json['secretKeyRef'] as Map<String, dynamic>);

Map<String, dynamic> _$EnvVarSourceToJson(EnvVarSource instance) =>
    <String, dynamic>{
      if (instance.configMapKeyRef case final value?) 'configMapKeyRef': value,
      if (instance.fieldRef case final value?) 'fieldRef': value,
      if (instance.resourceFieldRef case final value?)
        'resourceFieldRef': value,
      if (instance.secretKeyRef case final value?) 'secretKeyRef': value,
    };
