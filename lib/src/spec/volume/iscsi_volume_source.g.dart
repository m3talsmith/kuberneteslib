// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iscsi_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ISCSIVolumeSource _$ISCSIVolumeSourceFromJson(Map<String, dynamic> json) =>
    ISCSIVolumeSource()
      ..chapAuthDiscovery = json['chapAuthDiscovery'] as bool?
      ..chapAuthSession = json['chapAuthSession'] as bool?
      ..fsType = json['fsType'] as String?
      ..initiatorName = json['initiatorName'] as String?
      ..iqn = json['iqn'] as String?
      ..iscsiInterface = json['iscsiInterface'] as String?
      ..lun = (json['lun'] as num?)?.toInt()
      ..portals =
          (json['portals'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..readOnly = json['readOnly'] as bool?
      ..secretRef =
          _secretRefFromJson(json['secretRef'] as Map<String, dynamic>?)
      ..targetPortal = json['targetPortal'] as String?;

Map<String, dynamic> _$ISCSIVolumeSourceToJson(ISCSIVolumeSource instance) =>
    <String, dynamic>{
      'chapAuthDiscovery': instance.chapAuthDiscovery,
      'chapAuthSession': instance.chapAuthSession,
      'fsType': instance.fsType,
      'initiatorName': instance.initiatorName,
      'iqn': instance.iqn,
      'iscsiInterface': instance.iscsiInterface,
      'lun': instance.lun,
      'portals': instance.portals,
      'readOnly': instance.readOnly,
      if (_secretRefToJson(instance.secretRef) case final value?)
        'secretRef': value,
      'targetPortal': instance.targetPortal,
    };
