// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secret_key_selector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecretKeySelector _$SecretKeySelectorFromJson(Map<String, dynamic> json) =>
    SecretKeySelector()
      ..key = json['key'] as String?
      ..name = json['name'] as String?
      ..optional = json['optional'] as bool?;

Map<String, dynamic> _$SecretKeySelectorToJson(SecretKeySelector instance) =>
    <String, dynamic>{
      if (instance.key case final value?) 'key': value,
      if (instance.name case final value?) 'name': value,
      if (instance.optional case final value?) 'optional': value,
    };
