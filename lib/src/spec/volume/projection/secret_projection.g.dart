// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secret_projection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecretProjection _$SecretProjectionFromJson(Map<String, dynamic> json) =>
    SecretProjection(
      items: _itemsFromJson(json['items'] as List?),
      name: json['name'] as String?,
      optional: json['optional'] as bool?,
    );

Map<String, dynamic> _$SecretProjectionToJson(SecretProjection instance) =>
    <String, dynamic>{
      if (_itemsToJson(instance.items) case final value?) 'items': value,
      if (instance.name case final value?) 'name': value,
      if (instance.optional case final value?) 'optional': value,
    };
