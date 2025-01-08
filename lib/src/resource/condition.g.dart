// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
      message: json['message'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
      'type': instance.type,
      'status': instance.status,
      'message': instance.message,
    };
