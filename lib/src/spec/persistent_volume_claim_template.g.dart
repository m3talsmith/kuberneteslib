// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persistent_volume_claim_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersistentVolumeClaimTemplate _$PersistentVolumeClaimTemplateFromJson(
        Map<String, dynamic> json) =>
    PersistentVolumeClaimTemplate()
      ..metadata = ObjectMeta.fromJson(json['metadata'] as Map<String, dynamic>)
      ..spec = PersistentVolumeClaimSpec.fromJson(
          json['spec'] as Map<String, dynamic>);

Map<String, dynamic> _$PersistentVolumeClaimTemplateToJson(
        PersistentVolumeClaimTemplate instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
      'spec': instance.spec,
    };
