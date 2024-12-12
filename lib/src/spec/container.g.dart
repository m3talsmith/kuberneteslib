// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Container _$ContainerFromJson(Map<String, dynamic> json) => Container(
      args: (json['args'] as List<dynamic>?)?.map((e) => e as String).toList(),
      command:
          (json['command'] as List<dynamic>?)?.map((e) => e as String).toList(),
      env: (json['env'] as List<dynamic>?)
          ?.map((e) => EnvVar.fromJson(e as Map<String, dynamic>))
          .toList(),
      envFrom: (json['envFrom'] as List<dynamic>?)
          ?.map((e) => EnvFromSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] as String?,
      imagePullPolicy: json['imagePullPolicy'] as String?,
      lifecycle: json['lifecycle'] == null
          ? null
          : Lifecycle.fromJson(json['lifecycle'] as Map<String, dynamic>),
      livenessProbe: json['livenessProbe'] == null
          ? null
          : Probe.fromJson(json['livenessProbe'] as Map<String, dynamic>),
      name: json['name'] as String?,
      ports: _$JsonConverterFromJson<List<Map<String, dynamic>>,
              List<ContainerPort>>(
          json['ports'], const ContainerPortsConverter().fromJson),
      readinessProbe: json['readinessProbe'] == null
          ? null
          : Probe.fromJson(json['readinessProbe'] as Map<String, dynamic>),
      resizePolicy: (json['resizePolicy'] as List<dynamic>?)
          ?.map(
              (e) => ContainerResizePolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      resources: json['resources'] == null
          ? null
          : ResourceRequirements.fromJson(
              json['resources'] as Map<String, dynamic>),
      restartPolicy: json['restartPolicy'] as String?,
      securityContext: json['securityContext'] == null
          ? null
          : SecurityContext.fromJson(
              json['securityContext'] as Map<String, dynamic>),
      startupProbe: json['startupProbe'] == null
          ? null
          : Probe.fromJson(json['startupProbe'] as Map<String, dynamic>),
      stdin: json['stdin'] as bool?,
      stdinOnce: json['stdinOnce'] as bool?,
      terminationMessagePath: json['terminationMessagePath'] as String?,
      terminationMessagePolicy: json['terminationMessagePolicy'] as String?,
      tty: json['tty'] as bool?,
      volumeDevices: (json['volumeDevices'] as List<dynamic>?)
          ?.map((e) => VolumeDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
      volumeMounts: (json['volumeMounts'] as List<dynamic>?)
          ?.map((e) => VolumeMount.fromJson(e as Map<String, dynamic>))
          .toList(),
      workingDir: json['workingDir'] as String?,
    );

Map<String, dynamic> _$ContainerToJson(Container instance) => <String, dynamic>{
      if (instance.args case final value?) 'args': value,
      if (instance.command case final value?) 'command': value,
      if (instance.env case final value?) 'env': value,
      if (instance.envFrom case final value?) 'envFrom': value,
      if (instance.image case final value?) 'image': value,
      if (instance.imagePullPolicy case final value?) 'imagePullPolicy': value,
      if (instance.lifecycle case final value?) 'lifecycle': value,
      if (instance.livenessProbe case final value?) 'livenessProbe': value,
      if (instance.name case final value?) 'name': value,
      if (_$JsonConverterToJson<List<Map<String, dynamic>>,
                  List<ContainerPort>>(
              instance.ports, const ContainerPortsConverter().toJson)
          case final value?)
        'ports': value,
      if (instance.readinessProbe case final value?) 'readinessProbe': value,
      if (instance.resizePolicy case final value?) 'resizePolicy': value,
      if (instance.resources case final value?) 'resources': value,
      if (instance.restartPolicy case final value?) 'restartPolicy': value,
      if (instance.securityContext case final value?) 'securityContext': value,
      if (instance.startupProbe case final value?) 'startupProbe': value,
      if (instance.stdin case final value?) 'stdin': value,
      if (instance.stdinOnce case final value?) 'stdinOnce': value,
      if (instance.terminationMessagePath case final value?)
        'terminationMessagePath': value,
      if (instance.terminationMessagePolicy case final value?)
        'terminationMessagePolicy': value,
      if (instance.tty case final value?) 'tty': value,
      if (instance.volumeDevices case final value?) 'volumeDevices': value,
      if (instance.volumeMounts case final value?) 'volumeMounts': value,
      if (instance.workingDir case final value?) 'workingDir': value,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
