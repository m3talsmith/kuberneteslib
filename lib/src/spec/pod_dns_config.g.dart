// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_dns_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodDNSConfig _$PodDNSConfigFromJson(Map<String, dynamic> json) => PodDNSConfig()
  ..nameservers =
      (json['nameservers'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..options = (json['options'] as List<dynamic>?)
      ?.map((e) => PodDNSConfigOption.fromJson(e as Map<String, dynamic>))
      .toList()
  ..searches =
      (json['searches'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$PodDNSConfigToJson(PodDNSConfig instance) =>
    <String, dynamic>{
      'nameservers': instance.nameservers,
      'options': instance.options,
      'searches': instance.searches,
    };
