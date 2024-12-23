import 'package:json_annotation/json_annotation.dart';

part 'volume_device.g.dart';

/// Represents a block device in Kubernetes container storage.
///
/// VolumeDevice enables containers to use raw block devices for storage.
/// Key features include:
/// - Direct device access
/// - Block storage support
/// - Device path mapping
/// - Raw volume mounting
///
/// Common use cases:
/// - Database storage
/// - High-performance I/O
/// - Direct device access
/// - Storage-intensive workloads
///
/// Example:
/// ```dart
/// final device = VolumeDevice(
///   devicePath: '/dev/xvdf',
///   name: 'data-volume'
/// );
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#block-devices)
/// for more details about block device volumes.
@JsonSerializable()
class VolumeDevice {
  VolumeDevice({
    this.devicePath,
    this.name,
  });

  /// Path inside the container at which the device will be mounted.
  ///
  /// Examples:
  /// - '/dev/xvdf'
  /// - '/dev/sda'
  /// - '/dev/block/volume1'
  @JsonKey(includeIfNull: false)
  String? devicePath;

  /// Name of the volume that should be mounted as a device.
  ///
  /// Must match the name of a persistentVolumeClaim in the pod.
  @JsonKey(includeIfNull: false)
  String? name;

  factory VolumeDevice.fromJson(Map<String, dynamic> json) =>
      _$VolumeDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeDeviceToJson(this);
}
