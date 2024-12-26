import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'component_status.g.dart';

@JsonSerializable()
class ComponentStatusStatus implements Status {
  const ComponentStatusStatus();

  @override
  factory ComponentStatusStatus.fromJson(Map<String, dynamic> json) =>
      _$ComponentStatusStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ComponentStatusStatusToJson(this);
}
