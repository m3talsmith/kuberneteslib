// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typed_object_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypedObjectReference _$TypedObjectReferenceFromJson(
        Map<String, dynamic> json) =>
    TypedObjectReference(
      apiGroup: json['apiGroup'] as String?,
      kind: json['kind'] as String?,
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$TypedObjectReferenceToJson(
        TypedObjectReference instance) =>
    <String, dynamic>{
      if (instance.apiGroup case final value?) 'apiGroup': value,
      if (instance.kind case final value?) 'kind': value,
      if (instance.name case final value?) 'name': value,
      if (instance.namespace case final value?) 'namespace': value,
    };
