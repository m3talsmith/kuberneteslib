import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'persistent_volume.g.dart';

@JsonSerializable()
class PersistentVolumeStatus implements Status {
  const PersistentVolumeStatus();

  @override
  factory PersistentVolumeStatus.fromJson(Map<String, dynamic> json) =>
      _$PersistentVolumeStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PersistentVolumeStatusToJson(this);
}
