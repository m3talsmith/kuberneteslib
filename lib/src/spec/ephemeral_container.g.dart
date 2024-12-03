// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ephemeral_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EphemeralContainer _$EphemeralContainerFromJson(Map<String, dynamic> json) =>
    EphemeralContainer()
      ..args = (json['args'] as List<dynamic>).map((e) => e as String).toList()
      ..command =
          (json['command'] as List<dynamic>).map((e) => e as String).toList()
      ..env = (json['env'] as List<dynamic>)
          .map((e) => EnvVar.fromJson(e as Map<String, dynamic>))
          .toList()
      ..envFrom = (json['envFrom'] as List<dynamic>)
          .map((e) => EnvFromSource.fromJson(e as Map<String, dynamic>))
          .toList()
      ..image = json['image'] as String
      ..imagePullPolicy = json['imagePullPolicy'] as String
      ..lifecycle =
          Lifecycle.fromJson(json['lifecycle'] as Map<String, dynamic>)
      ..livenessProbe =
          Probe.fromJson(json['livenessProbe'] as Map<String, dynamic>)
      ..name = json['name'] as String;

Map<String, dynamic> _$EphemeralContainerToJson(EphemeralContainer instance) =>
    <String, dynamic>{
      'args': instance.args,
      'command': instance.command,
      'env': instance.env,
      'envFrom': instance.envFrom,
      'image': instance.image,
      'imagePullPolicy': instance.imagePullPolicy,
      'lifecycle': instance.lifecycle,
      'livenessProbe': instance.livenessProbe,
      'name': instance.name,
    };
