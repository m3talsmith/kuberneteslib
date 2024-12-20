// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_dns_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodDNSConfig _$PodDNSConfigFromJson(Map<String, dynamic> json) => PodDNSConfig()
  ..nameservers =
      (json['nameservers'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..options = _optionsFromJson(json['options'] as List?)
  ..searches =
      (json['searches'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$PodDNSConfigToJson(PodDNSConfig instance) =>
    <String, dynamic>{
      if (instance.nameservers case final value?) 'nameservers': value,
      if (_optionsToJson(instance.options) case final value?) 'options': value,
      if (instance.searches case final value?) 'searches': value,
    };
