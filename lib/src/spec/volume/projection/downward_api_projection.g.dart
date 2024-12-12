// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downward_api_projection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownwardAPIProjection _$DownwardAPIProjectionFromJson(
        Map<String, dynamic> json) =>
    DownwardAPIProjection(
      items: _itemsFromJson(json['items'] as List?),
    );

Map<String, dynamic> _$DownwardAPIProjectionToJson(
        DownwardAPIProjection instance) =>
    <String, dynamic>{
      if (_itemsToJson(instance.items) case final value?) 'items': value,
    };
