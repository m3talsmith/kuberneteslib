import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'replication_controller.g.dart';

@JsonSerializable()
class ReplicationControllerStatus implements Status {
  const ReplicationControllerStatus();

  @override
  factory ReplicationControllerStatus.fromJson(Map<String, dynamic> json) =>
      _$ReplicationControllerStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ReplicationControllerStatusToJson(this);
}
