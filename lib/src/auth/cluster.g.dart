// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cluster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClusterAuth _$ClusterAuthFromJson(Map<String, dynamic> json) => ClusterAuth(
      cluster: _clusterFromJson(json['cluster'] as Map<String, dynamic>?),
    )
      ..user = _userFromJson(json['user'] as Map<String, dynamic>?)
      ..token = json['token'] as String?
      ..expirationTimestamp = json['expirationTimestamp'] == null
          ? null
          : DateTime.parse(json['expirationTimestamp'] as String)
      ..clientCertificateAuthority = _$JsonConverterFromJson<String, Uint8List>(
          json['clientCertificateAuthority'],
          const Uint8ListConverter().fromJson)
      ..clientCertificateData = _$JsonConverterFromJson<String, Uint8List>(
          json['clientCertificateData'], const Uint8ListConverter().fromJson)
      ..clientKeyData = _$JsonConverterFromJson<String, Uint8List>(
          json['clientKeyData'], const Uint8ListConverter().fromJson);

Map<String, dynamic> _$ClusterAuthToJson(ClusterAuth instance) =>
    <String, dynamic>{
      if (_clusterToJson(instance.cluster) case final value?) 'cluster': value,
      if (_userToJson(instance.user) case final value?) 'user': value,
      if (instance.token case final value?) 'token': value,
      if (instance.expirationTimestamp?.toIso8601String() case final value?)
        'expirationTimestamp': value,
      if (_$JsonConverterToJson<String, Uint8List>(
              instance.clientCertificateAuthority,
              const Uint8ListConverter().toJson)
          case final value?)
        'clientCertificateAuthority': value,
      if (_$JsonConverterToJson<String, Uint8List>(
              instance.clientCertificateData, const Uint8ListConverter().toJson)
          case final value?)
        'clientCertificateData': value,
      if (_$JsonConverterToJson<String, Uint8List>(
              instance.clientKeyData, const Uint8ListConverter().toJson)
          case final value?)
        'clientKeyData': value,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
