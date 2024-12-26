import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'secret_set.g.dart';

@JsonSerializable()
class SecretSetStatus implements Status {
  const SecretSetStatus();

  @override
  factory SecretSetStatus.fromJson(Map<String, dynamic> json) =>
      _$SecretSetStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SecretSetStatusToJson(this);
}
