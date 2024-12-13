// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_projection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumeProjection _$VolumeProjectionFromJson(Map<String, dynamic> json) =>
    VolumeProjection()
      ..configMap = _configMapFromJson(json['configMap'])
      ..downwardAPI =
          _downwardAPIFromJson(json['downwardAPI'] as Map<String, dynamic>?)
      ..secret = _secretFromJson(json['secret'] as Map<String, dynamic>?)
      ..serviceAccountToken = _serviceAccountTokenFromJson(
          json['serviceAccountToken'] as Map<String, dynamic>?);

Map<String, dynamic> _$VolumeProjectionToJson(VolumeProjection instance) =>
    <String, dynamic>{
      if (_configMapToJson(instance.configMap) case final value?)
        'configMap': value,
      if (_downwardAPIToJson(instance.downwardAPI) case final value?)
        'downwardAPI': value,
      if (_secretToJson(instance.secret) case final value?) 'secret': value,
      if (_serviceAccountTokenToJson(instance.serviceAccountToken)
          case final value?)
        'serviceAccountToken': value,
    };
