// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_alias.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostAlias _$HostAliasFromJson(Map<String, dynamic> json) => HostAlias()
  ..hostnames =
      (json['hostnames'] as List<dynamic>).map((e) => e as String).toList()
  ..ip = json['ip'] as String;

Map<String, dynamic> _$HostAliasToJson(HostAlias instance) => <String, dynamic>{
      'hostnames': instance.hostnames,
      'ip': instance.ip,
    };
