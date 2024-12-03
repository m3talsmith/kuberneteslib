import '../local_object_reference.dart';
import 'package:json_annotation/json_annotation.dart';

part 'csi_volume_source.g.dart';

/// Represents a Container Storage Interface (CSI) volume in Kubernetes.
///
/// CSIVolumeSource enables pods to use storage from external providers through
/// the Container Storage Interface. Key features include:
/// - Vendor-agnostic storage integration
/// - Dynamic volume provisioning
/// - Storage feature standardization
///
/// Common use cases:
/// - Cloud provider storage integration
/// - Enterprise storage systems
/// - Custom storage solutions
///
/// Example:
/// ```dart
/// final csiVolume = CSIVolumeSource()
///   ..driver = 'ebs.csi.aws.com'
///   ..volumeAttributes = {
///     'size': '10Gi',
///     'type': 'gp3'
///   }
///   ..fsType = 'ext4'
///   ..readOnly = false
///   ..nodePublishSecretRef = LocalObjectReference()..name = 'csi-secret';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#csi)
/// for more details about CSI volumes.
@JsonSerializable()
class CSIVolumeSource {
  CSIVolumeSource();

  /// Name of the CSI driver to use for this volume.
  /// 
  /// Must match the driver name returned by CSI GetPluginInfo call.
  /// Required field.
  late String driver;

  /// Filesystem type to mount on the volume.
  /// 
  /// Must be a filesystem type supported by the host operating system.
  /// Examples: "ext4", "xfs", "ntfs"
  late String fsType;

  /// Reference to the secret for CSI node publish operations.
  /// 
  /// Contains credentials needed by the CSI driver to complete the
  /// NodePublishVolume call.
  late LocalObjectReference nodePublishSecretRef;

  /// Controls read-only access to the volume.
  /// 
  /// When true, the volume will be mounted read-only.
  /// Defaults to false (read/write).
  late bool readOnly;

  /// Driver-specific parameters for this volume.
  /// 
  /// These parameters are passed directly to the CSI driver
  /// to configure volume-specific features.
  late Map<String, dynamic> volumeAttributes;

  factory CSIVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$CSIVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$CSIVolumeSourceToJson(this);
}
