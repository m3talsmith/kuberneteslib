// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typed_local_object_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypedLocalObjectReference _$TypedLocalObjectReferenceFromJson(
        Map<String, dynamic> json) =>
    TypedLocalObjectReference()
      ..apiGroup = json['apiGroup'] as String
      ..kind = json['kind'] as String
      ..name = json['name'] as String;

Map<String, dynamic> _$TypedLocalObjectReferenceToJson(
        TypedLocalObjectReference instance) =>
    <String, dynamic>{
      'apiGroup': instance.apiGroup,
      'kind': instance.kind,
      'name': instance.name,
    };
