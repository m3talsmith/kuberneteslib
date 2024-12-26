import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'endpoints.g.dart';

@JsonSerializable()
class EndpointsStatus implements Status {
  const EndpointsStatus();

  @override
  factory EndpointsStatus.fromJson(Map<String, dynamic> json) =>
      _$EndpointsStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EndpointsStatusToJson(this);
}
