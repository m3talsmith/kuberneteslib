import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'namespace.g.dart';

@JsonSerializable()
class NamespaceStatus implements Status {
  const NamespaceStatus();

  @override
  factory NamespaceStatus.fromJson(Map<String, dynamic> json) =>
      _$NamespaceStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NamespaceStatusToJson(this);
}
