import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'service.g.dart';

@JsonSerializable()
class ServiceStatus implements Status {
  const ServiceStatus();

  @override
  factory ServiceStatus.fromJson(Map<String, dynamic> json) =>
      _$ServiceStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ServiceStatusToJson(this);
}
