import 'package:json_annotation/json_annotation.dart';

part 'persistent_volume_claim_volume_source.g.dart';

/// Represents a PersistentVolumeClaim (PVC) volume in Kubernetes.
///
/// PersistentVolumeClaimVolumeSource enables pods to use PersistentVolumeClaims
/// for storage. Key features include:
/// - Dynamic volume provisioning
/// - Storage class selection
/// - Resource requests and limits
/// - Access mode control
///
/// Common use cases:
/// - Database storage
/// - Shared application data
/// - Stateful applications
/// - Cloud-native storage
///
/// Example:
/// ```dart
/// final pvcVolume = PersistentVolumeClaimVolumeSource()
///   ..claimName = 'my-app-storage'
///   ..readOnly = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)
/// for more details about PersistentVolumeClaims.
@JsonSerializable()
class PersistentVolumeClaimVolumeSource {
  PersistentVolumeClaimVolumeSource();

  /// Name of the PersistentVolumeClaim in the pod's namespace.
  /// 
  /// Required: References an existing PVC in the same namespace.
  /// The volume will be mounted as specified in the claim.
  @JsonKey(includeIfNull: false)
  String? claimName;

  /// Controls read-only access to the volume.
  /// 
  /// Optional: Defaults to false (read/write).
  /// When true, the volume will be mounted read-only.
  @JsonKey(includeIfNull: false)
  bool? readOnly;

  /// Creates a PersistentVolumeClaimVolumeSource from a map structure.
  /// 
  /// Parameters:
  /// - [data]: Map containing 'claimName' and optional 'readOnly' values
  PersistentVolumeClaimVolumeSource.fromMap(Map<String, dynamic> data) {
    claimName = data['claimName'];
    readOnly = data['readOnly'];
  }

  factory PersistentVolumeClaimVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$PersistentVolumeClaimVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$PersistentVolumeClaimVolumeSourceToJson(this);
}
