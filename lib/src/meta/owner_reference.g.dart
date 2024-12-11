// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerReference _$OwnerReferenceFromJson(Map<String, dynamic> json) =>
    OwnerReference()
      ..apiVersion = json['apiVersion'] as String?
      ..blockOwnerDeletion = json['blockOwnerDeletion'] as bool?
      ..controller = json['controller'] as bool?
      ..kind = json['kind'] as String?
      ..name = json['name'] as String?
      ..uid = json['uid'] as String?;

Map<String, dynamic> _$OwnerReferenceToJson(OwnerReference instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'blockOwnerDeletion': instance.blockOwnerDeletion,
      'controller': instance.controller,
      'kind': instance.kind,
      'name': instance.name,
      'uid': instance.uid,
    };
