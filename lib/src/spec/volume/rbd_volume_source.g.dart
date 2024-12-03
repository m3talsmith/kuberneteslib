// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rbd_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RBDVolumeSource _$RBDVolumeSourceFromJson(Map<String, dynamic> json) =>
    RBDVolumeSource()
      ..fsType = json['fsType'] as String
      ..image = json['image'] as String
      ..keyring = json['keyring'] as String
      ..monitors =
          (json['monitors'] as List<dynamic>).map((e) => e as String).toList()
      ..pool = json['pool'] as String
      ..readOnly = json['readOnly'] as bool
      ..secretRef = LocalObjectReference.fromJson(
          json['secretRef'] as Map<String, dynamic>)
      ..user = json['user'] as String;

Map<String, dynamic> _$RBDVolumeSourceToJson(RBDVolumeSource instance) =>
    <String, dynamic>{
      'fsType': instance.fsType,
      'image': instance.image,
      'keyring': instance.keyring,
      'monitors': instance.monitors,
      'pool': instance.pool,
      'readOnly': instance.readOnly,
      'secretRef': instance.secretRef,
      'user': instance.user,
    };
