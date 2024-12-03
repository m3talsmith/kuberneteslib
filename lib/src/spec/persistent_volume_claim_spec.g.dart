// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persistent_volume_claim_spec.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersistentVolumeClaimSpec _$PersistentVolumeClaimSpecFromJson(
        Map<String, dynamic> json) =>
    PersistentVolumeClaimSpec()
      ..accessModes = (json['accessModes'] as List<dynamic>)
          .map((e) => e as String)
          .toList()
      ..dataSource = TypedLocalObjectReference.fromJson(
          json['dataSource'] as Map<String, dynamic>)
      ..dataSourceRef = TypedObjectReference.fromJson(
          json['dataSourceRef'] as Map<String, dynamic>)
      ..resources = ResourceRequirements.fromJson(
          json['resources'] as Map<String, dynamic>)
      ..selector =
          LabelSelector.fromJson(json['selector'] as Map<String, dynamic>)
      ..storageClassName = json['storageClassName'] as String
      ..volumeMode = json['volumeMode'] as String
      ..volumeName = json['volumeName'] as String;

Map<String, dynamic> _$PersistentVolumeClaimSpecToJson(
        PersistentVolumeClaimSpec instance) =>
    <String, dynamic>{
      'accessModes': instance.accessModes,
      'dataSource': instance.dataSource,
      'dataSourceRef': instance.dataSourceRef,
      'resources': instance.resources,
      'selector': instance.selector,
      'storageClassName': instance.storageClassName,
      'volumeMode': instance.volumeMode,
      'volumeName': instance.volumeName,
    };
