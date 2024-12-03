import 'package:json_annotation/json_annotation.dart';

import '../../spec/local_object_reference.dart';

part 'storage_os_volume_source.g.dart';

/// Represents a StorageOS volume in Kubernetes for cloud-native storage.
///
/// StorageOSVolumeSource enables pods to use StorageOS distributed storage.
/// Key features include:
/// - Software-defined storage
/// - High availability
/// - Data encryption
/// - Cross-platform support
/// - Container-native design
///
/// Common use cases:
/// - Containerized databases
/// - Stateful applications
/// - Development environments
/// - CI/CD pipelines
///
/// Example:
/// ```dart
/// final storageOSVolume = StorageOSVolumeSource()
///   ..volumeName = 'test-volume'
///   ..volumeNamespace = 'default'
///   ..fsType = 'ext4'
///   ..readOnly = false
///   ..secretRef = LocalObjectReference()..name = 'storageos-secret';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#storageos)
/// for more details about StorageOS volumes.
@JsonSerializable()
class StorageOSVolumeSource {
  StorageOSVolumeSource();

  /// The filesystem type to mount.
  /// 
  /// Required: Must be a filesystem type supported by the host operating system.
  /// Examples: "ext4", "xfs", "ntfs"
  late String fsType;

  /// Controls read-only access to the volume.
  /// 
  /// When true, the volume will be mounted read-only.
  /// When false, the volume will be mounted with read-write permissions.
  late bool readOnly;

  /// Reference to the secret containing StorageOS credentials.
  /// 
  /// Required: References a Kubernetes secret containing the StorageOS API credentials.
  /// The secret must exist in the same namespace as the pod.
  late LocalObjectReference secretRef;

  /// The name of the StorageOS volume.
  /// 
  /// Required: Must be a valid volume name in the StorageOS system.
  late String volumeName;

  /// The namespace where the StorageOS volume resides.
  /// 
  /// Required: Specifies the StorageOS namespace for the volume.
  /// Usually matches the Kubernetes namespace but can be different.
  late String volumeNamespace;

  factory StorageOSVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$StorageOSVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$StorageOSVolumeSourceToJson(this);
}
