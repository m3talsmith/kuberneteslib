import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'event_set.g.dart';

@JsonSerializable()
class EventSetStatus implements Status {
  const EventSetStatus();

  @override
  factory EventSetStatus.fromJson(Map<String, dynamic> json) =>
      _$EventSetStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EventSetStatusToJson(this);
}
