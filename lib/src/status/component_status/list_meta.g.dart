// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentStatusListMeta _$ComponentStatusListMetaFromJson(
        Map<String, dynamic> json) =>
    ComponentStatusListMeta(
      continueState: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$ComponentStatusListMetaToJson(
        ComponentStatusListMeta instance) =>
    <String, dynamic>{
      if (instance.continueState case final value?) 'continue': value,
      if (instance.remainingItemCount case final value?)
        'remainingItemCount': value,
      if (instance.resourceVersion case final value?) 'resourceVersion': value,
      if (instance.selfLink case final value?) 'selfLink': value,
    };
