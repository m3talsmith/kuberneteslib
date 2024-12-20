// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerReference _$OwnerReferenceFromJson(Map<String, dynamic> json) =>
    OwnerReference(
      apiVersion: json['apiVersion'] as String?,
      blockOwnerDeletion: json['blockOwnerDeletion'] as bool?,
      controller: json['controller'] as bool?,
      kind: json['kind'] as String?,
      name: json['name'] as String?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$OwnerReferenceToJson(OwnerReference instance) =>
    <String, dynamic>{
      if (instance.apiVersion case final value?) 'apiVersion': value,
      if (instance.blockOwnerDeletion case final value?)
        'blockOwnerDeletion': value,
      if (instance.controller case final value?) 'controller': value,
      if (instance.kind case final value?) 'kind': value,
      if (instance.name case final value?) 'name': value,
      if (instance.uid case final value?) 'uid': value,
    };
