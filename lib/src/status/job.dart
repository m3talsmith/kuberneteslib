import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'job.g.dart';

@JsonSerializable()
class JobStatus implements Status {
  const JobStatus();

  @override
  factory JobStatus.fromJson(Map<String, dynamic> json) =>
      _$JobStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$JobStatusToJson(this);
}
