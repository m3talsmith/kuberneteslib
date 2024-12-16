import '../../spec/local_object_reference.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cinder_volume_source.g.dart';

/// Represents an OpenStack Cinder volume that can be mounted in Kubernetes pods.
///
/// CinderVolumeSource enables pods to use OpenStack Cinder volumes for
/// persistent storage. Key features include:
/// - Support for various filesystem types
/// - Read-only mounting option
/// - Secure credential management via secrets
///
/// Common use cases:
/// - Database storage
/// - Persistent application data
/// - Cloud-native OpenStack workloads
///
/// Example:
/// ```dart
/// final cinderVolume = CinderVolumeSource()
///   ..volumeID = 'vol-0123456789'
///   ..fsType = 'ext4'
///   ..readOnly = false
///   ..secretRef = LocalObjectReference()..name = 'cinder-secret';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#cinder)
/// for more details about Cinder volumes.

Map<String, dynamic>? _secretRefToJson(LocalObjectReference? ref) =>
    ref?.toJson();

LocalObjectReference? _secretRefFromJson(Map<String, dynamic>? json) =>
    json == null ? null : LocalObjectReference.fromJson(json);

@JsonSerializable()
class CinderVolumeSource {
  CinderVolumeSource(
      {this.fsType, this.readOnly, this.secretRef, this.volumeID});

  /// The filesystem type to mount on the volume.
  ///
  /// Must be supported by the host operating system.
  /// Common values: "ext4", "xfs", "ntfs"
  @JsonKey(includeIfNull: false)
  String? fsType;

  /// Controls read-only access to the volume.
  ///
  /// When true, the volume will be mounted read-only.
  /// Defaults to false (read/write).
  @JsonKey(includeIfNull: false, defaultValue: false)
  bool? readOnly;

  /// Reference to the secret containing OpenStack credentials.
  ///
  /// Contains authentication details needed to connect to the
  /// OpenStack Cinder service.
  @JsonKey(
      toJson: _secretRefToJson,
      fromJson: _secretRefFromJson,
      includeIfNull: false)
  LocalObjectReference? secretRef;

  /// The unique identifier for the Cinder volume.
  ///
  /// This ID must correspond to an existing volume in the
  /// OpenStack Cinder service.
  @JsonKey(includeIfNull: false)
  String? volumeID;

  factory CinderVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$CinderVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$CinderVolumeSourceToJson(this);
}
