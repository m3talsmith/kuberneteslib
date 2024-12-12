// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_map_projection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigMapProjection _$ConfigMapProjectionFromJson(Map<String, dynamic> json) =>
    ConfigMapProjection()
      ..items = _itemsFromJson(json['items'] as List?)
      ..name = json['name'] as String?
      ..optional = json['optional'] as bool?;

Map<String, dynamic> _$ConfigMapProjectionToJson(
        ConfigMapProjection instance) =>
    <String, dynamic>{
      if (_itemsToJson(instance.items) case final value?) 'items': value,
      if (instance.name case final value?) 'name': value,
      if (instance.optional case final value?) 'optional': value,
    };
