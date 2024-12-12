// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectMeta _$ObjectMetaFromJson(Map<String, dynamic> json) => ObjectMeta(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$ObjectMetaToJson(ObjectMeta instance) =>
    <String, dynamic>{
      'name': instance.name,
      if (instance.namespace case final value?) 'namespace': value,
    };
