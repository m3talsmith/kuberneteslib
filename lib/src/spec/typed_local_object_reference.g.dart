// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typed_local_object_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypedLocalObjectReference _$TypedLocalObjectReferenceFromJson(
        Map<String, dynamic> json) =>
    TypedLocalObjectReference(
      apiGroup: json['apiGroup'] as String?,
      kind: json['kind'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TypedLocalObjectReferenceToJson(
        TypedLocalObjectReference instance) =>
    <String, dynamic>{
      if (instance.apiGroup case final value?) 'apiGroup': value,
      if (instance.kind case final value?) 'kind': value,
      if (instance.name case final value?) 'name': value,
    };
