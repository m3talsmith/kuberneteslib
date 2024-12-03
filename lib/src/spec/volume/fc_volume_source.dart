import 'package:json_annotation/json_annotation.dart';

part 'fc_volume_source.g.dart';

/// Represents a Fibre Channel (FC) persistent volume in Kubernetes.
///
/// FCVolumeSource enables pods to use existing Fibre Channel block storage volumes.
/// Key features include:
/// - Support for multiple WWNs and LUNs
/// - Read-only mount options
/// - Various filesystem types
/// - Direct block device access
///
/// Common use cases:
/// - Enterprise storage integration
/// - High-performance database storage
/// - Legacy system integration
///
/// Example:
/// ```dart
/// final fcVolume = FCVolumeSource()
///   ..targetWWNs = ['50060e801049cfd1']
///   ..lun = 0
///   ..fsType = 'ext4'
///   ..readOnly = false
///   ..wwids = ['3600a098038303634'];
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#fc)
/// for more details about Fibre Channel volumes.
@JsonSerializable()
class FCVolumeSource {
  FCVolumeSource();

  /// Filesystem type to mount on the volume.
  /// 
  /// Must be a filesystem type supported by the host operating system.
  /// Examples: 'ext4', 'xfs', 'ntfs'
  late String fsType;

  /// Fibre Channel target logical unit number.
  /// 
  /// The unique identifier for a logical unit of storage
  /// presented by the FC target.
  late int lun;

  /// Controls read-only access to the volume.
  /// 
  /// When true, the volume will be mounted read-only.
  /// Defaults to false (read/write).
  late bool readOnly;

  /// Fibre Channel target World Wide Names (WWN).
  /// 
  /// List of FC target worldwide names (WWNs) that identify
  /// the storage devices to use.
  late List<String> targetWWNs;

  /// Optional Fibre Channel World Wide Identifiers (WWID).
  /// 
  /// List of FC volume world wide identifiers (wwids).
  /// Either wwids or combination of targetWWNs and lun must be set.
  late List<String> wwids;

  factory FCVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$FCVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$FCVolumeSourceToJson(this);
}
