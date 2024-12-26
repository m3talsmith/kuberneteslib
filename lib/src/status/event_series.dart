import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'event_series.g.dart';

@JsonSerializable()
class EventSeriesStatus implements Status {
  const EventSeriesStatus();

  @override
  factory EventSeriesStatus.fromJson(Map<String, dynamic> json) =>
      _$EventSeriesStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EventSeriesStatusToJson(this);
}
