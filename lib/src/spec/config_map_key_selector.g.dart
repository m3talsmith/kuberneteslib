// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_map_key_selector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigMapKeySelector _$ConfigMapKeySelectorFromJson(
        Map<String, dynamic> json) =>
    ConfigMapKeySelector()
      ..key = json['key'] as String
      ..name = json['name'] as String
      ..optional = json['optional'] as bool;

Map<String, dynamic> _$ConfigMapKeySelectorToJson(
        ConfigMapKeySelector instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'optional': instance.optional,
    };
