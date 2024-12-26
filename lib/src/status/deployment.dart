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

  @JsonKey(includeIfNull: false)
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
