import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'limit_range.g.dart';

@JsonSerializable()
class LimitRangeStatus implements Status {
  const LimitRangeStatus();

  @override
  factory LimitRangeStatus.fromJson(Map<String, dynamic> json) =>
      _$LimitRangeStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LimitRangeStatusToJson(this);
}
