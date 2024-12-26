import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'node.g.dart';

@JsonSerializable()
class NodeStatus implements Status {
  const NodeStatus();

  @override
  factory NodeStatus.fromJson(Map<String, dynamic> json) =>
      _$NodeStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NodeStatusToJson(this);
}
