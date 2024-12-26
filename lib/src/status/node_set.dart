import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'node_set.g.dart';

@JsonSerializable()
class NodeSetStatus implements Status {
  const NodeSetStatus();

  @override
  factory NodeSetStatus.fromJson(Map<String, dynamic> json) =>
      _$NodeSetStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NodeSetStatusToJson(this);
}
