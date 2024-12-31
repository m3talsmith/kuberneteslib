// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentStatusStatus _$ComponentStatusStatusFromJson(
        Map<String, dynamic> json) =>
    ComponentStatusStatus(
      apiVersion: json['apiVersion'] as String?,
      items: _itemsFromJson(json['items'] as List?),
      kind: json['kind'] as String?,
      metadata: _metadataFromJson(json['metadata'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$ComponentStatusStatusToJson(
        ComponentStatusStatus instance) =>
    <String, dynamic>{
      if (instance.apiVersion case final value?) 'apiVersion': value,
      if (_itemsToJson(instance.items) case final value?) 'items': value,
      if (instance.kind case final value?) 'kind': value,
      if (_metadataToJson(instance.metadata) case final value?)
        'metadata': value,
    };
