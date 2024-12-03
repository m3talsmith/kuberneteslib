// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typed_object_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypedObjectReference _$TypedObjectReferenceFromJson(
        Map<String, dynamic> json) =>
    TypedObjectReference()
      ..apiGroup = json['apiGroup'] as String
      ..kind = json['kind'] as String
      ..name = json['name'] as String
      ..namespace = json['namespace'] as String;

Map<String, dynamic> _$TypedObjectReferenceToJson(
        TypedObjectReference instance) =>
    <String, dynamic>{
      'apiGroup': instance.apiGroup,
      'kind': instance.kind,
      'name': instance.name,
      'namespace': instance.namespace,
    };
