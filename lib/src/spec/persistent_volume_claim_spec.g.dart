// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persistent_volume_claim_spec.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersistentVolumeClaimSpec _$PersistentVolumeClaimSpecFromJson(
        Map<String, dynamic> json) =>
    PersistentVolumeClaimSpec(
      accessModes: (json['accessModes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      dataSource:
          _dataSourceFromJson(json['dataSource'] as Map<String, dynamic>?),
      dataSourceRef: _dataSourceRefFromJson(
          json['dataSourceRef'] as Map<String, dynamic>?),
      resources: _resourcesFromJson(json['resources'] as Map<String, dynamic>?),
      selector: _selectorFromJson(json['selector'] as Map<String, dynamic>?),
      storageClassName: json['storageClassName'] as String?,
      volumeMode: json['volumeMode'] as String?,
      volumeName: json['volumeName'] as String?,
    );

Map<String, dynamic> _$PersistentVolumeClaimSpecToJson(
        PersistentVolumeClaimSpec instance) =>
    <String, dynamic>{
      if (instance.accessModes case final value?) 'accessModes': value,
      if (_dataSourceToJson(instance.dataSource) case final value?)
        'dataSource': value,
      if (_dataSourceRefToJson(instance.dataSourceRef) case final value?)
        'dataSourceRef': value,
      if (_resourcesToJson(instance.resources) case final value?)
        'resources': value,
      if (_selectorToJson(instance.selector) case final value?)
        'selector': value,
      if (instance.storageClassName case final value?)
        'storageClassName': value,
      if (instance.volumeMode case final value?) 'volumeMode': value,
      if (instance.volumeName case final value?) 'volumeName': value,
    };
