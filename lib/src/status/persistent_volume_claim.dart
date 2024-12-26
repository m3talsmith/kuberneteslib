import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'persistent_volume_claim.g.dart';

@JsonSerializable()
class PersistentVolumeClaimStatus implements Status {
  const PersistentVolumeClaimStatus();

  @override
  factory PersistentVolumeClaimStatus.fromJson(Map<String, dynamic> json) =>
      _$PersistentVolumeClaimStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PersistentVolumeClaimStatusToJson(this);
}
