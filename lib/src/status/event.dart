import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'event.g.dart';

@JsonSerializable()
class EventStatus implements Status {
  const EventStatus();

  @override
  factory EventStatus.fromJson(Map<String, dynamic> json) =>
      _$EventStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EventStatusToJson(this);
}
