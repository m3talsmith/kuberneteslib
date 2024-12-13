// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persistent_volume_claim_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersistentVolumeClaimTemplate _$PersistentVolumeClaimTemplateFromJson(
        Map<String, dynamic> json) =>
    PersistentVolumeClaimTemplate()
      ..metadata = _metadataFromJson(json['metadata'] as Map<String, dynamic>?)
      ..spec = _specFromJson(json['spec'] as Map<String, dynamic>?);

Map<String, dynamic> _$PersistentVolumeClaimTemplateToJson(
        PersistentVolumeClaimTemplate instance) =>
    <String, dynamic>{
      if (_metadataToJson(instance.metadata) case final value?)
        'metadata': value,
      if (_specToJson(instance.spec) case final value?) 'spec': value,
    };
