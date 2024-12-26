// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deployment_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeploymentCondition _$DeploymentConditionFromJson(Map<String, dynamic> json) =>
    DeploymentCondition(
      lastTransitionTime: json['lastTransitionTime'] == null
          ? null
          : DateTime.parse(json['lastTransitionTime'] as String),
      lastUpdateTime: json['lastUpdateTime'] == null
          ? null
          : DateTime.parse(json['lastUpdateTime'] as String),
      message: json['message'] as String?,
      reason: json['reason'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$DeploymentConditionToJson(
        DeploymentCondition instance) =>
    <String, dynamic>{
      if (instance.lastTransitionTime?.toIso8601String() case final value?)
        'lastTransitionTime': value,
      if (instance.lastUpdateTime?.toIso8601String() case final value?)
        'lastUpdateTime': value,
      if (instance.message case final value?) 'message': value,
      if (instance.reason case final value?) 'reason': value,
      if (instance.status case final value?) 'status': value,
      if (instance.type case final value?) 'type': value,
    };
