// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Context _$ContextFromJson(Map<String, dynamic> json) => Context(
      cluster: json['cluster'] as String?,
      user: json['user'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ContextToJson(Context instance) => <String, dynamic>{
      if (instance.cluster case final value?) 'cluster': value,
      if (instance.user case final value?) 'user': value,
    };
