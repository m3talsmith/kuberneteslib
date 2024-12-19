// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ephemeral_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EphemeralContainer _$EphemeralContainerFromJson(Map<String, dynamic> json) =>
    EphemeralContainer(
      args: (json['args'] as List<dynamic>?)?.map((e) => e as String).toList(),
      command:
          (json['command'] as List<dynamic>?)?.map((e) => e as String).toList(),
      env: _envFromJson(json['env'] as List?),
      envFrom: _envFromFromJson(json['envFrom'] as List?),
      image: json['image'] as String?,
      imagePullPolicy: json['imagePullPolicy'] as String?,
      lifecycle: _lifecycleFromJson(json['lifecycle'] as Map<String, dynamic>?),
      livenessProbe: _livenessProbeFromJson(
          json['livenessProbe'] as Map<String, dynamic>?),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$EphemeralContainerToJson(EphemeralContainer instance) =>
    <String, dynamic>{
      'args': instance.args,
      'command': instance.command,
      if (_envToJson(instance.env) case final value?) 'env': value,
      if (_envFromToJson(instance.envFrom) case final value?) 'envFrom': value,
      'image': instance.image,
      'imagePullPolicy': instance.imagePullPolicy,
      if (_lifecycleToJson(instance.lifecycle) case final value?)
        'lifecycle': value,
      if (_livenessProbeToJson(instance.livenessProbe) case final value?)
        'livenessProbe': value,
      'name': instance.name,
    };
