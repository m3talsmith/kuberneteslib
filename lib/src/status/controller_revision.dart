import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'controller_revision.g.dart';

@JsonSerializable()
class ControllerRevisionStatus implements Status {
  const ControllerRevisionStatus();

  @override
  factory ControllerRevisionStatus.fromJson(Map<String, dynamic> json) =>
      _$ControllerRevisionStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ControllerRevisionStatusToJson(this);
}
