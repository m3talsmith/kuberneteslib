import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'pod_set.g.dart';

@JsonSerializable()
class PodSetStatus implements Status {
  const PodSetStatus();

  @override
  factory PodSetStatus.fromJson(Map<String, dynamic> json) =>
      _$PodSetStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PodSetStatusToJson(this);
}
