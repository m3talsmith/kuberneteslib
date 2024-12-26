import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'replica_set.g.dart';

@JsonSerializable()
class ReplicaSetStatus implements Status {
  const ReplicaSetStatus();

  @override
  factory ReplicaSetStatus.fromJson(Map<String, dynamic> json) =>
      _$ReplicaSetStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ReplicaSetStatusToJson(this);
}
