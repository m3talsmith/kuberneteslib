import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'daemon_set.g.dart';

@JsonSerializable()
class DaemonSetStatus implements Status {
  const DaemonSetStatus();

  @override
  factory DaemonSetStatus.fromJson(Map<String, dynamic> json) =>
      _$DaemonSetStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DaemonSetStatusToJson(this);
}
