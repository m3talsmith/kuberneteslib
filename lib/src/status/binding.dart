import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'binding.g.dart';

@JsonSerializable()
class BindingStatus implements Status {
  const BindingStatus();

  @override
  factory BindingStatus.fromJson(Map<String, dynamic> json) =>
      _$BindingStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BindingStatusToJson(this);
}
