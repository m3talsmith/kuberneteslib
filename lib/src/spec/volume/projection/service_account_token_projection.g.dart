// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_account_token_projection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceAccountTokenProjection _$ServiceAccountTokenProjectionFromJson(
        Map<String, dynamic> json) =>
    ServiceAccountTokenProjection()
      ..audience = json['audience'] as String?
      ..expirationSeconds = (json['expirationSeconds'] as num?)?.toInt()
      ..path = json['path'] as String?;

Map<String, dynamic> _$ServiceAccountTokenProjectionToJson(
        ServiceAccountTokenProjection instance) =>
    <String, dynamic>{
      if (instance.audience case final value?) 'audience': value,
      if (instance.expirationSeconds case final value?)
        'expirationSeconds': value,
      if (instance.path case final value?) 'path': value,
    };
