import 'package:json_annotation/json_annotation.dart';

import 'deployment/deployment_condition.dart';
import 'status.dart';

part 'deployment.g.dart';

@JsonSerializable()
class DeploymentStatus implements Status {
  const DeploymentStatus({
    this.availableReplicas,
    this.collisionCount,
    this.conditions,
    this.observedGeneration,
    this.readyReplicas,
    this.replicas,
    this.unavailableReplicas,
    this.updatedReplicas,
  });

  @JsonKey(includeIfNull: false)
  final int? availableReplicas;

  @JsonKey(includeIfNull: false)
  final int? collisionCount;

  @JsonKey(
    includeIfNull: false,
    fromJson: _conditionsFromJson,
    toJson: _conditionsToJson,
  )
  final List<DeploymentCondition>? conditions;

  @JsonKey(includeIfNull: false)
  final int? observedGeneration;

  @JsonKey(includeIfNull: false)
  final int? readyReplicas;

  @JsonKey(includeIfNull: false)
  final int? replicas;

  @JsonKey(includeIfNull: false)
  final int? unavailableReplicas;

  @JsonKey(includeIfNull: false)
  final int? updatedReplicas;

  @override
  factory DeploymentStatus.fromJson(Map<String, dynamic> json) =>
      _$DeploymentStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeploymentStatusToJson(this);
}

List<DeploymentCondition>? _conditionsFromJson(List<dynamic>? json) => json
    ?.map((e) => DeploymentCondition.fromJson(e as Map<String, dynamic>))
    .toList();

List<Map<String, dynamic>>? _conditionsToJson(
        List<DeploymentCondition>? conditions) =>
    conditions?.map((e) => e.toJson()).toList();
