import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'namespace_set.g.dart';

@JsonSerializable()
class NamespaceSetStatus implements Status {
  const NamespaceSetStatus();

  @override
  factory NamespaceSetStatus.fromJson(Map<String, dynamic> json) =>
      _$NamespaceSetStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NamespaceSetStatusToJson(this);
}
