import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'volume_set.g.dart';

@JsonSerializable()
class VolumeSetStatus implements Status {
  const VolumeSetStatus();

  @override
  factory VolumeSetStatus.fromJson(Map<String, dynamic> json) =>
      _$VolumeSetStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VolumeSetStatusToJson(this);
}
