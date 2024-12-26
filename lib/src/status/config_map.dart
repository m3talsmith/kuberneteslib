import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'config_map.g.dart';

@JsonSerializable()
class ConfigMapStatus implements Status {
  const ConfigMapStatus();

  @override
  factory ConfigMapStatus.fromJson(Map<String, dynamic> json) =>
      _$ConfigMapStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ConfigMapStatusToJson(this);
}
