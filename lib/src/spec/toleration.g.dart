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
      'effect': instance.effect,
      'key': instance.key,
      'operator': instance.operator,
      'tolerationSeconds': instance.tolerationSeconds,
      'value': instance.value,
    };
