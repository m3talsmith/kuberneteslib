// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exec.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exec _$ExecFromJson(Map<String, dynamic> json) => Exec(
      command: json['command'] as String? ?? 'doctl',
      arguments: (json['arguments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      apiVersion: json['apiVersion'] as String? ??
          'client.authentication.k8s.io/v1beta1',
      env: json['env'] as String?,
      interactiveMode: json['interactiveMode'] as String? ?? 'IfAvailable',
      provideClusterInfo: json['provideClusterInfo'] as bool? ?? false,
    );

Map<String, dynamic> _$ExecToJson(Exec instance) => <String, dynamic>{
      if (instance.command case final value?) 'command': value,
      if (instance.arguments case final value?) 'arguments': value,
      if (instance.apiVersion case final value?) 'apiVersion': value,
      if (instance.env case final value?) 'env': value,
      if (instance.interactiveMode case final value?) 'interactiveMode': value,
      if (instance.provideClusterInfo case final value?)
        'provideClusterInfo': value,
    };

ExecResult _$ExecResultFromJson(Map<String, dynamic> json) => ExecResult(
      kind: json['kind'] as String,
      apiVersion: json['apiVersion'] as String,
      spec: ExecSpec.fromJson(json['spec'] as Map<String, dynamic>),
      status: ExecStatus.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExecResultToJson(ExecResult instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'apiVersion': instance.apiVersion,
      'spec': instance.spec,
      'status': instance.status,
    };

ExecSpec _$ExecSpecFromJson(Map<String, dynamic> json) => ExecSpec(
      interactive: json['interactive'] as bool? ?? false,
    );

Map<String, dynamic> _$ExecSpecToJson(ExecSpec instance) => <String, dynamic>{
      if (instance.interactive case final value?) 'interactive': value,
    };

ExecStatus _$ExecStatusFromJson(Map<String, dynamic> json) => ExecStatus(
      expirationTimestamp: json['expirationTimestamp'] == null
          ? null
          : DateTime.parse(json['expirationTimestamp'] as String),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ExecStatusToJson(ExecStatus instance) =>
    <String, dynamic>{
      if (instance.expirationTimestamp?.toIso8601String() case final value?)
        'expirationTimestamp': value,
      if (instance.token case final value?) 'token': value,
    };
