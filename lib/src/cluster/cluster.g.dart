// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cluster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cluster _$ClusterFromJson(Map<String, dynamic> json) => Cluster(
      certificateAuthorityData: json['certificate-authority-data'] as String?,
      server: json['server'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ClusterToJson(Cluster instance) => <String, dynamic>{
      if (instance.certificateAuthorityData case final value?)
        'certificate-authority-data': value,
      if (instance.server case final value?) 'server': value,
    };
