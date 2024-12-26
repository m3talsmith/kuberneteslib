import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'volume.g.dart';

@JsonSerializable()
class VolumeStatus implements Status {
  const VolumeStatus();

  @override
  factory VolumeStatus.fromJson(Map<String, dynamic> json) =>
      _$VolumeStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VolumeStatusToJson(this);
}
