// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
      clientCertificateData: json['clientCertificateData'] as String?,
      clientKeyData: json['clientKeyData'] as String?,
      exec: json['exec'] == null
          ? null
          : Exec.fromJson(json['exec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'clientCertificateData': instance.clientCertificateData,
      'clientKeyData': instance.clientKeyData,
      'exec': instance.exec,
    };
