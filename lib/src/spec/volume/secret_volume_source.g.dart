// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secret_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecretVolumeSource _$SecretVolumeSourceFromJson(Map<String, dynamic> json) =>
    SecretVolumeSource()
      ..defaultMode = (json['defaultMode'] as num?)?.toInt()
      ..items = (json['items'] as List<dynamic>?)
          ?.map((e) => KeyToPath.fromJson(e as Map<String, dynamic>))
          .toList()
      ..optional = json['optional'] as bool?
      ..secretName = json['secretName'] as String?;

Map<String, dynamic> _$SecretVolumeSourceToJson(SecretVolumeSource instance) =>
    <String, dynamic>{
      if (instance.defaultMode case final value?) 'defaultMode': value,
      if (instance.items case final value?) 'items': value,
      if (instance.optional case final value?) 'optional': value,
      if (instance.secretName case final value?) 'secretName': value,
    };
