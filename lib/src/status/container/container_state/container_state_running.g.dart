// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container_state_running.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContainerStateRunning _$ContainerStateRunningFromJson(
        Map<String, dynamic> json) =>
    ContainerStateRunning(
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
    );

Map<String, dynamic> _$ContainerStateRunningToJson(
        ContainerStateRunning instance) =>
    <String, dynamic>{
      if (instance.startedAt?.toIso8601String() case final value?)
        'startedAt': value,
    };
