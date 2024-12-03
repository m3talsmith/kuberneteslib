// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Configs _$ConfigsFromJson(Map<String, dynamic> json) => Configs();

Map<String, dynamic> _$ConfigsToJson(Configs instance) => <String, dynamic>{};

Config _$ConfigFromJson(Map<String, dynamic> json) => Config()
  ..apiVersion = json['apiVersion'] as String?
  ..clusters = (json['clusters'] as List<dynamic>)
      .map((e) => Cluster.fromJson(e as Map<String, dynamic>))
      .toList()
  ..contexts = (json['contexts'] as List<dynamic>)
      .map((e) => Context.fromJson(e as Map<String, dynamic>))
      .toList()
  ..currentContext = json['currentContext'] as String?
  ..kind = json['kind'] as String?
  ..preferences = json['preferences'] as Map<String, dynamic>
  ..users = (json['users'] as List<dynamic>)
      .map((e) => User.fromJson(e as Map<String, dynamic>))
      .toList()
  ..displayName = json['displayName'] as String?;

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      if (instance.apiVersion case final value?) 'apiVersion': value,
      'clusters': instance.clusters,
      'contexts': instance.contexts,
      if (instance.currentContext case final value?) 'currentContext': value,
      if (instance.kind case final value?) 'kind': value,
      'preferences': instance.preferences,
      'users': instance.users,
      if (instance.displayName case final value?) 'displayName': value,
    };
