// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persistent_volume_claim_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersistentVolumeClaimVolumeSource _$PersistentVolumeClaimVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    PersistentVolumeClaimVolumeSource()
      ..claimName = json['claimName'] as String?
      ..readOnly = json['readOnly'] as bool?;

Map<String, dynamic> _$PersistentVolumeClaimVolumeSourceToJson(
        PersistentVolumeClaimVolumeSource instance) =>
    <String, dynamic>{
      if (instance.claimName case final value?) 'claimName': value,
      if (instance.readOnly case final value?) 'readOnly': value,
    };
