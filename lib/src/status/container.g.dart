// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContainerStatus _$ContainerStatusFromJson(Map<String, dynamic> json) =>
    ContainerStatus(
      allocatedResources: json['allocatedResources'] as Map<String, dynamic>?,
      containerID: json['containerID'] as String?,
      image: json['image'] as String?,
      imageID: json['imageID'] as String?,
      lastState: _lastStateFromJson(json['lastState'] as Map<String, dynamic>?),
      name: json['name'] as String?,
      ready: json['ready'] as bool?,
      resources: _resourcesFromJson(json['resources'] as Map<String, dynamic>?),
    )
      ..restartCount = (json['restartCount'] as num?)?.toInt()
      ..started = json['started'] as bool?
      ..state = _stateFromJson(json['state'] as Map<String, dynamic>?);

Map<String, dynamic> _$ContainerStatusToJson(ContainerStatus instance) =>
    <String, dynamic>{
      if (instance.allocatedResources case final value?)
        'allocatedResources': value,
      if (instance.containerID case final value?) 'containerID': value,
      if (instance.image case final value?) 'image': value,
      if (instance.imageID case final value?) 'imageID': value,
      if (_lastStateToJson(instance.lastState) case final value?)
        'lastState': value,
      if (instance.name case final value?) 'name': value,
      if (instance.ready case final value?) 'ready': value,
      if (_resourcesToJson(instance.resources) case final value?)
        'resources': value,
      if (instance.restartCount case final value?) 'restartCount': value,
      if (instance.started case final value?) 'started': value,
      if (_stateToJson(instance.state) case final value?) 'state': value,
    };
