// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_projection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumeProjection _$VolumeProjectionFromJson(Map<String, dynamic> json) =>
    VolumeProjection()
      ..configMap = json['configMap'] == null
          ? null
          : ConfigMapProjection.fromJson(
              json['configMap'] as Map<String, dynamic>)
      ..downwardAPI = json['downwardAPI'] == null
          ? null
          : DownwardAPIProjection.fromJson(
              json['downwardAPI'] as Map<String, dynamic>)
      ..secret = json['secret'] == null
          ? null
          : SecretProjection.fromJson(json['secret'] as Map<String, dynamic>)
      ..serviceAccountToken = json['serviceAccountToken'] == null
          ? null
          : ServiceAccountTokenProjection.fromJson(
              json['serviceAccountToken'] as Map<String, dynamic>);

Map<String, dynamic> _$VolumeProjectionToJson(VolumeProjection instance) =>
    <String, dynamic>{
      if (instance.configMap case final value?) 'configMap': value,
      if (instance.downwardAPI case final value?) 'downwardAPI': value,
      if (instance.secret case final value?) 'secret': value,
      if (instance.serviceAccountToken case final value?)
        'serviceAccountToken': value,
    };
