// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'se_linux_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SELinuxOptions _$SELinuxOptionsFromJson(Map<String, dynamic> json) =>
    SELinuxOptions()
      ..level = json['level'] as String?
      ..role = json['role'] as String?
      ..type = json['type'] as String?
      ..user = json['user'] as String?;

Map<String, dynamic> _$SELinuxOptionsToJson(SELinuxOptions instance) =>
    <String, dynamic>{
      if (instance.level case final value?) 'level': value,
      if (instance.role case final value?) 'role': value,
      if (instance.type case final value?) 'type': value,
      if (instance.user case final value?) 'user': value,
    };
