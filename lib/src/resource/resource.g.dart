// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resource _$ResourceFromJson(Map<String, dynamic> json) => Resource(
      metadata: _$JsonConverterFromJson<Map<String, dynamic>, ObjectMeta>(
          json['metadata'], const ObjectMetaConverter().fromJson),
      kind: json['kind'] as String?,
      namespace: json['namespace'] as String?,
      auth: Resource._authFromJson(json['auth']),
      apiVersion: json['apiVersion'] as String?,
    )
      ..spec = _specFromJson(json['spec'] as Map<String, dynamic>?)
      ..status = _statusFromJson(json['status'] as Map<String, dynamic>?)
      ..conditions = _conditionsFromJson(json['conditions'] as List?);

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
      if (instance.apiVersion case final value?) 'apiVersion': value,
      if (_$JsonConverterToJson<Map<String, dynamic>, ObjectMeta>(
              instance.metadata, const ObjectMetaConverter().toJson)
          case final value?)
        'metadata': value,
      if (_specToJson(instance.spec) case final value?) 'spec': value,
      if (_statusToJson(instance.status) case final value?) 'status': value,
      if (instance.kind case final value?) 'kind': value,
      if (instance.namespace case final value?) 'namespace': value,
      if (_conditionsToJson(instance.conditions) case final value?)
        'conditions': value,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
