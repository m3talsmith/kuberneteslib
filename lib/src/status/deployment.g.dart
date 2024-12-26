// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deployment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeploymentStatus _$DeploymentStatusFromJson(Map<String, dynamic> json) =>
    DeploymentStatus(
      availableReplicas: (json['availableReplicas'] as num?)?.toInt(),
      collisionCount: (json['collisionCount'] as num?)?.toInt(),
      conditions: (json['conditions'] as List<dynamic>?)
          ?.map((e) => DeploymentCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
      readyReplicas: (json['readyReplicas'] as num?)?.toInt(),
      replicas: (json['replicas'] as num?)?.toInt(),
      unavailableReplicas: (json['unavailableReplicas'] as num?)?.toInt(),
      updatedReplicas: (json['updatedReplicas'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DeploymentStatusToJson(DeploymentStatus instance) =>
    <String, dynamic>{
      if (instance.availableReplicas case final value?)
        'availableReplicas': value,
      if (instance.collisionCount case final value?) 'collisionCount': value,
      if (instance.conditions case final value?) 'conditions': value,
      if (instance.observedGeneration case final value?)
        'observedGeneration': value,
      if (instance.readyReplicas case final value?) 'readyReplicas': value,
      if (instance.replicas case final value?) 'replicas': value,
      if (instance.unavailableReplicas case final value?)
        'unavailableReplicas': value,
      if (instance.updatedReplicas case final value?) 'updatedReplicas': value,
    };
