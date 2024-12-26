import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'pod_disruption_budget.g.dart';

@JsonSerializable()
class PodDisruptionBudgetStatus implements Status {
  const PodDisruptionBudgetStatus();

  @override
  factory PodDisruptionBudgetStatus.fromJson(Map<String, dynamic> json) =>
      _$PodDisruptionBudgetStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PodDisruptionBudgetStatusToJson(this);
}
