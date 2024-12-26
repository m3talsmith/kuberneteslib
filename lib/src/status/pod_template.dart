import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'pod_template.g.dart';

@JsonSerializable()
class PodTemplateStatus implements Status {
  const PodTemplateStatus();

  @override
  factory PodTemplateStatus.fromJson(Map<String, dynamic> json) =>
      _$PodTemplateStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PodTemplateStatusToJson(this);
}
