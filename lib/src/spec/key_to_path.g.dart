// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_to_path.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KeyToPath _$KeyToPathFromJson(Map<String, dynamic> json) => KeyToPath()
  ..key = json['key'] as String?
  ..mode = (json['mode'] as num?)?.toInt()
  ..path = json['path'] as String?;

Map<String, dynamic> _$KeyToPathToJson(KeyToPath instance) => <String, dynamic>{
      if (instance.key case final value?) 'key': value,
      if (instance.mode case final value?) 'mode': value,
      if (instance.path case final value?) 'path': value,
    };
