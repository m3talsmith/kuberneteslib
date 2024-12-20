// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_field_selector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectFieldSelector _$ObjectFieldSelectorFromJson(Map<String, dynamic> json) =>
    ObjectFieldSelector(
      apiVersion: json['apiVersion'] as String?,
      fieldPath: json['fieldPath'] as String?,
    );

Map<String, dynamic> _$ObjectFieldSelectorToJson(
        ObjectFieldSelector instance) =>
    <String, dynamic>{
      if (instance.apiVersion case final value?) 'apiVersion': value,
      if (instance.fieldPath case final value?) 'fieldPath': value,
    };
