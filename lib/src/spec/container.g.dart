// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecContainer _$SpecContainerFromJson(Map<String, dynamic> json) =>
    SpecContainer(
      args: (json['args'] as List<dynamic>?)?.map((e) => e as String).toList(),
      command:
          (json['command'] as List<dynamic>?)?.map((e) => e as String).toList(),
      env: (json['env'] as List<dynamic>?)
          ?.map((e) => EnvVar.fromJson(e as Map<String, dynamic>))
          .toList(),
      envFrom: _envFromFromJson(json['envFrom'] as List?),
      image: json['image'] as String?,
      imagePullPolicy: json['imagePullPolicy'] as String?,
      lifecycle: _lifecycleFromJson(json['lifecycle'] as Map<String, dynamic>?),
      livenessProbe:
          _probeFromJson(json['livenessProbe'] as Map<String, dynamic>?),
      name: json['name'] as String?,
      ports: _$JsonConverterFromJson<List<Map<String, dynamic>>,
              List<ContainerPort>>(
          json['ports'], const ContainerPortsConverter().fromJson),
      readinessProbe:
          _probeFromJson(json['readinessProbe'] as Map<String, dynamic>?),
      resizePolicy: _resizePolicyFromJson(json['resizePolicy'] as List?),
      resources: _resourceRequirementsFromJson(
          json['resources'] as Map<String, dynamic>?),
      restartPolicy: json['restartPolicy'] as String?,
      securityContext: _securityContextFromJson(
          json['securityContext'] as Map<String, dynamic>?),
      startupProbe:
          _probeFromJson(json['startupProbe'] as Map<String, dynamic>?),
      stdin: json['stdin'] as bool?,
      stdinOnce: json['stdinOnce'] as bool?,
      terminationMessagePath: json['terminationMessagePath'] as String?,
      terminationMessagePolicy: json['terminationMessagePolicy'] as String?,
      tty: json['tty'] as bool?,
      volumeDevices: _volumeDevicesFromJson(json['volumeDevices'] as List?),
      volumeMounts: _volumeMountsFromJson(json['volumeMounts'] as List?),
      workingDir: json['workingDir'] as String?,
    );

Map<String, dynamic> _$SpecContainerToJson(SpecContainer instance) =>
    <String, dynamic>{
      if (instance.args case final value?) 'args': value,
      if (instance.command case final value?) 'command': value,
      if (instance.env case final value?) 'env': value,
      if (_envFromToJson(instance.envFrom) case final value?) 'envFrom': value,
      if (instance.image case final value?) 'image': value,
      if (instance.imagePullPolicy case final value?) 'imagePullPolicy': value,
      if (_lifecycleToJson(instance.lifecycle) case final value?)
        'lifecycle': value,
      if (_probeToJson(instance.livenessProbe) case final value?)
        'livenessProbe': value,
      if (instance.name case final value?) 'name': value,
      if (_$JsonConverterToJson<List<Map<String, dynamic>>,
                  List<ContainerPort>>(
              instance.ports, const ContainerPortsConverter().toJson)
          case final value?)
        'ports': value,
      if (_probeToJson(instance.readinessProbe) case final value?)
        'readinessProbe': value,
      if (_resizePolicyToJson(instance.resizePolicy) case final value?)
        'resizePolicy': value,
      if (_resourceRequirementsToJson(instance.resources) case final value?)
        'resources': value,
      if (instance.restartPolicy case final value?) 'restartPolicy': value,
      if (_securityContextToJson(instance.securityContext) case final value?)
        'securityContext': value,
      if (_probeToJson(instance.startupProbe) case final value?)
        'startupProbe': value,
      if (instance.stdin case final value?) 'stdin': value,
      if (instance.stdinOnce case final value?) 'stdinOnce': value,
      if (instance.terminationMessagePath case final value?)
        'terminationMessagePath': value,
      if (instance.terminationMessagePolicy case final value?)
        'terminationMessagePolicy': value,
      if (instance.tty case final value?) 'tty': value,
      if (_volumeDevicesToJson(instance.volumeDevices) case final value?)
        'volumeDevices': value,
      if (_volumeMountsToJson(instance.volumeMounts) case final value?)
        'volumeMounts': value,
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
