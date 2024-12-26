import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'secret.g.dart';

@JsonSerializable()
class SecretStatus implements Status {
  const SecretStatus();

  @override
  factory SecretStatus.fromJson(Map<String, dynamic> json) =>
      _$SecretStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SecretStatusToJson(this);
}
