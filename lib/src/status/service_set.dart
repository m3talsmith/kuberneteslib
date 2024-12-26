import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'service_set.g.dart';

@JsonSerializable()
class ServiceSetStatus implements Status {
  const ServiceSetStatus();

  @override
  factory ServiceSetStatus.fromJson(Map<String, dynamic> json) =>
      _$ServiceSetStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ServiceSetStatusToJson(this);
}
