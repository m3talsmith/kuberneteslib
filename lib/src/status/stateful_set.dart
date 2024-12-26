import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'stateful_set.g.dart';

@JsonSerializable()
class StatefulSetStatus implements Status {
  const StatefulSetStatus();

  @override
  factory StatefulSetStatus.fromJson(Map<String, dynamic> json) =>
      _$StatefulSetStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StatefulSetStatusToJson(this);
}
