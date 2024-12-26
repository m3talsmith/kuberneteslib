// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container_state_terminated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContainerStateTerminated _$ContainerStateTerminatedFromJson(
        Map<String, dynamic> json) =>
    ContainerStateTerminated(
      containerID: json['containerID'] as String?,
      exitCode: json['exitCode'] as String?,
      finishedAt: json['finishedAt'] == null
          ? null
          : DateTime.parse(json['finishedAt'] as String),
      message: json['message'] as String?,
      reason: json['reason'] as String?,
      signal: (json['signal'] as num?)?.toInt(),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
    );

Map<String, dynamic> _$ContainerStateTerminatedToJson(
        ContainerStateTerminated instance) =>
    <String, dynamic>{
      if (instance.containerID case final value?) 'containerID': value,
      if (instance.exitCode case final value?) 'exitCode': value,
      if (instance.finishedAt?.toIso8601String() case final value?)
        'finishedAt': value,
      if (instance.message case final value?) 'message': value,
      if (instance.reason case final value?) 'reason': value,
      if (instance.signal case final value?) 'signal': value,
      if (instance.startedAt?.toIso8601String() case final value?)
        'startedAt': value,
    };
