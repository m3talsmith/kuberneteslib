import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'config_map_set.g.dart';

@JsonSerializable()
class ConfigMapSetStatus implements Status {
  const ConfigMapSetStatus();

  @override
  factory ConfigMapSetStatus.fromJson(Map<String, dynamic> json) =>
      _$ConfigMapSetStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ConfigMapSetStatusToJson(this);
}
