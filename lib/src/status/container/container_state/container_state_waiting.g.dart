// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container_state_waiting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContainerStateWaiting _$ContainerStateWaitingFromJson(
        Map<String, dynamic> json) =>
    ContainerStateWaiting(
      message: json['message'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$ContainerStateWaitingToJson(
        ContainerStateWaiting instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.reason case final value?) 'reason': value,
    };
