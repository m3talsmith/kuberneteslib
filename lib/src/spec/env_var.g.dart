// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_var.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnvVar _$EnvVarFromJson(Map<String, dynamic> json) => EnvVar()
  ..name = json['name'] as String
  ..value = json['value'] as String?
  ..valueFrom = json['valueFrom'] == null
      ? null
      : EnvVarSource.fromJson(json['valueFrom'] as Map<String, dynamic>);

Map<String, dynamic> _$EnvVarToJson(EnvVar instance) => <String, dynamic>{
      'name': instance.name,
      if (instance.value case final value?) 'value': value,
      if (instance.valueFrom case final value?) 'valueFrom': value,
    };
