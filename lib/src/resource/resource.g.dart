// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resource _$ResourceFromJson(Map<String, dynamic> json) => Resource(
      metadata: json['metadata'] == null
          ? null
          : ObjectMeta.fromJson(json['metadata'] as Map<String, dynamic>),
      kind: json['kind'] as String?,
      namespace: json['namespace'] as String?,
      auth: Resource._authFromJson(json['auth']),
    )
      ..apiVersion = json['apiVersion'] as String?
      ..spec = json['spec'] == null
          ? null
          : Spec.fromJson(json['spec'] as Map<String, dynamic>)
      ..status = json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>);

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
      if (instance.apiVersion case final value?) 'apiVersion': value,
      if (instance.metadata case final value?) 'metadata': value,
      if (instance.spec case final value?) 'spec': value,
      if (instance.status case final value?) 'status': value,
      if (instance.kind case final value?) 'kind': value,
      if (instance.namespace case final value?) 'namespace': value,
    };
