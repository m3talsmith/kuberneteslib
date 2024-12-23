// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toleration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Toleration _$TolerationFromJson(Map<String, dynamic> json) => Toleration()
  ..effect = json['effect'] as String?
  ..key = json['key'] as String?
  ..operator = json['operator'] as String?
  ..tolerationSeconds = (json['tolerationSeconds'] as num?)?.toInt()
  ..value = json['value'] as String?;

Map<String, dynamic> _$TolerationToJson(Toleration instance) =>
    <String, dynamic>{
      if (instance.effect case final value?) 'effect': value,
      if (instance.key case final value?) 'key': value,
      if (instance.operator case final value?) 'operator': value,
      if (instance.tolerationSeconds case final value?)
        'tolerationSeconds': value,
      if (instance.value case final value?) 'value': value,
    };
