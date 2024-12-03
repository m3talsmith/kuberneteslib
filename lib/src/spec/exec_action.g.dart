// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exec_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExecAction _$ExecActionFromJson(Map<String, dynamic> json) => ExecAction()
  ..command =
      (json['command'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$ExecActionToJson(ExecAction instance) =>
    <String, dynamic>{
      if (instance.command case final value?) 'command': value,
    };
