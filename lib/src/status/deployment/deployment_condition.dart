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

  @JsonKey(
    includeIfNull: false,
    fromJson: _lastTransitionTimeFromJson,
    toJson: _lastTransitionTimeToJson,
  )
  final DateTime? lastTransitionTime;

  @JsonKey(
    includeIfNull: false,
    fromJson: _lastUpdateTimeFromJson,
    toJson: _lastUpdateTimeToJson,
  )
  final DateTime? lastUpdateTime;

  @JsonKey(includeIfNull: false)
  final String? message;

  @JsonKey(includeIfNull: false)
  final String? reason;

  @JsonKey(includeIfNull: false)
  final String? status;

  @JsonKey(includeIfNull: false)
  final String? type;

  factory DeploymentCondition.fromJson(Map<String, dynamic> json) =>
      _$DeploymentConditionFromJson(json);

  Map<String, dynamic> toJson() => _$DeploymentConditionToJson(this);
}

DateTime? _lastTransitionTimeFromJson(String? json) =>
    json == null ? null : DateTime.parse(json);

String? _lastTransitionTimeToJson(DateTime? date) => date?.toIso8601String();

DateTime? _lastUpdateTimeFromJson(String? json) =>
    json == null ? null : DateTime.parse(json);

String? _lastUpdateTimeToJson(DateTime? date) => date?.toIso8601String();
