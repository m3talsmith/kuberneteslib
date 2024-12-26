// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContainerState _$ContainerStateFromJson(Map<String, dynamic> json) =>
    ContainerState(
      running: _runningFromJson(json['running'] as Map<String, dynamic>?),
      terminated:
          _terminatedFromJson(json['terminated'] as Map<String, dynamic>?),
      waiting: _waitingFromJson(json['waiting'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$ContainerStateToJson(ContainerState instance) =>
    <String, dynamic>{
      if (_runningToJson(instance.running) case final value?) 'running': value,
      if (_terminatedToJson(instance.terminated) case final value?)
        'terminated': value,
      if (_waitingToJson(instance.waiting) case final value?) 'waiting': value,
    };
