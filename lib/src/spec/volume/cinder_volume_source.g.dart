// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinder_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinderVolumeSource _$CinderVolumeSourceFromJson(Map<String, dynamic> json) =>
    CinderVolumeSource(
      fsType: json['fsType'] as String?,
      readOnly: json['readOnly'] as bool? ?? false,
      secretRef: _secretRefFromJson(json['secretRef'] as Map<String, dynamic>?),
      volumeID: json['volumeID'] as String?,
    );

Map<String, dynamic> _$CinderVolumeSourceToJson(CinderVolumeSource instance) =>
    <String, dynamic>{
      if (instance.fsType case final value?) 'fsType': value,
      if (instance.readOnly case final value?) 'readOnly': value,
      if (_secretRefToJson(instance.secretRef) case final value?)
        'secretRef': value,
      if (instance.volumeID case final value?) 'volumeID': value,
    };
