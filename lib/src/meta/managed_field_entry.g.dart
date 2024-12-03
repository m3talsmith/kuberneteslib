// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'managed_field_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManagedFieldEntry _$ManagedFieldEntryFromJson(Map<String, dynamic> json) =>
    ManagedFieldEntry()
      ..apiVersion = json['apiVersion'] as String
      ..fieldsType = json['fieldsType'] as String
      ..fieldsV1 = FieldsV1.fromJson(json['fieldsV1'] as Map<String, dynamic>)
      ..manager = json['manager'] as String
      ..operation = json['operation'] as String
      ..time = DateTime.parse(json['time'] as String);

Map<String, dynamic> _$ManagedFieldEntryToJson(ManagedFieldEntry instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'fieldsType': instance.fieldsType,
      'fieldsV1': instance.fieldsV1,
      'manager': instance.manager,
      'operation': instance.operation,
      'time': instance.time.toIso8601String(),
    };
