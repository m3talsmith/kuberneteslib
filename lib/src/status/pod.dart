import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'pod.g.dart';

@JsonSerializable()
class PodStatus implements Status {
  const PodStatus();

  @override
  factory PodStatus.fromJson(Map<String, dynamic> json) =>
      _$PodStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PodStatusToJson(this);
}
