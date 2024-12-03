// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seccomp_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeccompProfile _$SeccompProfileFromJson(Map<String, dynamic> json) =>
    SeccompProfile()
      ..localhostProfile = json['localhostProfile'] as String?
      ..type = json['type'] as String?;

Map<String, dynamic> _$SeccompProfileToJson(SeccompProfile instance) =>
    <String, dynamic>{
      if (instance.localhostProfile case final value?)
        'localhostProfile': value,
      if (instance.type case final value?) 'type': value,
    };
