import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'cron_job.g.dart';

@JsonSerializable()
class CronJobStatus implements Status {
  const CronJobStatus();

  @override
  factory CronJobStatus.fromJson(Map<String, dynamic> json) =>
      _$CronJobStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CronJobStatusToJson(this);
}
