import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'service_account.g.dart';

@JsonSerializable()
class ServiceAccountStatus implements Status {
  const ServiceAccountStatus();

  @override
  factory ServiceAccountStatus.fromJson(Map<String, dynamic> json) =>
      _$ServiceAccountStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ServiceAccountStatusToJson(this);
}
