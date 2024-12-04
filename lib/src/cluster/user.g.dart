// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
      clientCertificateData: json['client-certificate-data'] as String?,
      clientKeyData: json['client-key-data'] as String?,
      exec: json['exec'] == null
          ? null
          : Exec.fromJson(json['exec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      if (instance.clientCertificateData case final value?)
        'client-certificate-data': value,
      if (instance.clientKeyData case final value?) 'client-key-data': value,
      if (instance.exec case final value?) 'exec': value,
    };
