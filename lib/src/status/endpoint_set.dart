import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'endpoint_set.g.dart';

@JsonSerializable()
class EndpointSetStatus implements Status {
  const EndpointSetStatus();

  @override
  factory EndpointSetStatus.fromJson(Map<String, dynamic> json) =>
      _$EndpointSetStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EndpointSetStatusToJson(this);
}
