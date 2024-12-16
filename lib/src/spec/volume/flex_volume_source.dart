import 'package:json_annotation/json_annotation.dart';

import '../../spec/local_object_reference.dart';

part 'flex_volume_source.g.dart';

/// Represents a FlexVolume in Kubernetes for vendor-specific storage integration.
///
/// FlexVolumeSource enables pods to use storage solutions that don't have built-in
/// plugins. Key features include:
/// - Custom driver integration
/// - Flexible mount options
/// - Secret management
/// - Driver-specific configuration
///
/// Common use cases:
/// - Legacy storage systems
/// - Custom storage solutions
/// - Specialized storage requirements
///
/// Example:
/// ```dart
/// final flexVolume = FlexVolumeSource()
///   ..driver = 'vendor/storage-driver'
///   ..fsType = 'ext4'
///   ..options = {
///     'volumeID': 'vol123',
///     'size': '100Gi'
///   }
///   ..readOnly = false
///   ..secretRef = LocalObjectReference()..name = 'storage-secret';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#flexvolume)
/// for more details about FlexVolume.
@JsonSerializable()
class FlexVolumeSource {
  FlexVolumeSource();

  /// The name of the FlexVolume driver to use.
  ///
  /// Must be pre-installed on the nodes and registered with
  /// the kubelet. Example: "vendor/storage-driver"
  late String driver;

  /// The filesystem type to mount.
  ///
  /// Must be a filesystem type supported by the host operating system.
  /// Examples: "ext4", "xfs", "ntfs"
  late String fsType;

  /// Additional options for the FlexVolume driver.
  ///
  /// These are passed directly to the FlexVolume driver when mounting
  /// the volume. The available options depend on the specific driver.
  late Map<String, dynamic> options;

  /// Controls read-only access to the volume.
  ///
  /// When true, the volume will be mounted read-only.
  /// Defaults to false (read/write).
  late bool readOnly;

  /// Reference to a secret containing sensitive information.
  ///
  /// The secret will be passed to the FlexVolume driver during mount
  /// operations. Used for credentials or other sensitive data.
  late LocalObjectReference secretRef;

  factory FlexVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$FlexVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$FlexVolumeSourceToJson(this);
}
