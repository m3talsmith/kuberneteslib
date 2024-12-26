import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'resource_quota.g.dart';

@JsonSerializable()
class ResourceQuotaStatus implements Status {
  const ResourceQuotaStatus();

  @override
  factory ResourceQuotaStatus.fromJson(Map<String, dynamic> json) =>
      _$ResourceQuotaStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResourceQuotaStatusToJson(this);
}
