// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ephemeral_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EphemeralVolumeSource _$EphemeralVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    EphemeralVolumeSource(
      volumeClaimTemplate: _volumeClaimTemplateFromJson(
          json['volumeClaimTemplate'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$EphemeralVolumeSourceToJson(
        EphemeralVolumeSource instance) =>
    <String, dynamic>{
      if (_volumeClaimTemplateToJson(instance.volumeClaimTemplate)
          case final value?)
        'volumeClaimTemplate': value,
    };
