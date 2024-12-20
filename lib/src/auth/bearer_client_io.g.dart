// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bearer_client_io.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BearerClient _$BearerClientFromJson(Map<String, dynamic> json) => BearerClient(
      token: json['token'] as String,
      expirationTimestamp: json['expirationTimestamp'] == null
          ? null
          : DateTime.parse(json['expirationTimestamp'] as String),
    );

Map<String, dynamic> _$BearerClientToJson(BearerClient instance) =>
    <String, dynamic>{
      'token': instance.token,
      if (instance.expirationTimestamp?.toIso8601String() case final value?)
        'expirationTimestamp': value,
    };
