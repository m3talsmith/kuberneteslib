// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'managed_field_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManagedFieldEntry _$ManagedFieldEntryFromJson(Map<String, dynamic> json) =>
    ManagedFieldEntry(
      apiVersion: json['apiVersion'] as String?,
      fieldsType: json['fieldsType'] as String?,
      fieldsV1: _$JsonConverterFromJson<Map<String, dynamic>, FieldsV1>(
          json['fieldsV1'], const FieldV1Converter().fromJson),
      manager: json['manager'] as String?,
      operation: json['operation'] as String?,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$ManagedFieldEntryToJson(ManagedFieldEntry instance) =>
    <String, dynamic>{
      if (instance.apiVersion case final value?) 'apiVersion': value,
      if (instance.fieldsType case final value?) 'fieldsType': value,
      if (_$JsonConverterToJson<Map<String, dynamic>, FieldsV1>(
              instance.fieldsV1, const FieldV1Converter().toJson)
          case final value?)
        'fieldsV1': value,
      if (instance.manager case final value?) 'manager': value,
      if (instance.operation case final value?) 'operation': value,
      if (instance.time?.toIso8601String() case final value?) 'time': value,
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
