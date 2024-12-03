// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quobyte_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuobyteVolumeSource _$QuobyteVolumeSourceFromJson(Map<String, dynamic> json) =>
    QuobyteVolumeSource()
      ..group = json['group'] as String
      ..readOnly = json['readOnly'] as bool
      ..registry = json['registry'] as String
      ..tenant = json['tenant'] as String
      ..user = json['user'] as String
      ..volume = json['volume'] as String;

Map<String, dynamic> _$QuobyteVolumeSourceToJson(
        QuobyteVolumeSource instance) =>
    <String, dynamic>{
      'group': instance.group,
      'readOnly': instance.readOnly,
      'registry': instance.registry,
      'tenant': instance.tenant,
      'user': instance.user,
      'volume': instance.volume,
    };
