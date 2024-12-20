// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_dns_config_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodDNSConfigOption _$PodDNSConfigOptionFromJson(Map<String, dynamic> json) =>
    PodDNSConfigOption()
      ..name = json['name'] as String?
      ..value = json['value'] as String?;

Map<String, dynamic> _$PodDNSConfigOptionToJson(PodDNSConfigOption instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.value case final value?) 'value': value,
    };
