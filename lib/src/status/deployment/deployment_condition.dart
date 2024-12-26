import 'package:json_annotation/json_annotation.dart';

part 'deployment_condition.g.dart';

@JsonSerializable()
class DeploymentCondition {
  const DeploymentCondition({
    this.lastTransitionTime,
    this.lastUpdateTime,
    this.message,
    this.reason,
    this.status,
    this.type,
  });

  @JsonKey(includeIfNull: false)
  final DateTime? lastTransitionTime;

  @JsonKey(includeIfNull: false)
  final DateTime? lastUpdateTime;

  @JsonKey(includeIfNull: false)
  final String? message;

  @JsonKey(includeIfNull: false)
  final String? reason;

  @JsonKey(includeIfNull: false)
  final String? status;

  @JsonKey(includeIfNull: false)
  final String? type;

  @override
  factory DeploymentCondition.fromJson(Map<String, dynamic> json) =>
      _$DeploymentConditionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeploymentConditionToJson(this);
}
