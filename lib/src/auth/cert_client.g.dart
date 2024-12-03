// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cert_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertClient _$CertClientFromJson(Map<String, dynamic> json) => CertClient(
      clientCertificateAuthority: const Uint8ListConverter()
          .fromJson(json['clientCertificateAuthority'] as String),
      clientCertificateData: const Uint8ListConverter()
          .fromJson(json['clientCertificateData'] as String),
      clientKeyData:
          const Uint8ListConverter().fromJson(json['clientKeyData'] as String),
    );

Map<String, dynamic> _$CertClientToJson(CertClient instance) =>
    <String, dynamic>{
      'clientCertificateAuthority': const Uint8ListConverter()
          .toJson(instance.clientCertificateAuthority),
      'clientCertificateData':
          const Uint8ListConverter().toJson(instance.clientCertificateData),
      'clientKeyData':
          const Uint8ListConverter().toJson(instance.clientKeyData),
    };
