import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

@JsonSerializable()
class Condition {
  String? type;
  String? status;
  String? message;

  Condition({
    this.message,
    this.status,
    this.type,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
