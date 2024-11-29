import '../../spec/local_object_reference.dart';

/// Represents a StorageOS volume source.
/// 
/// This class is used to specify the configuration for a StorageOS volume.
class StorageOSVolumeSource {
  /// The filesystem type to mount. Must be a filesystem type supported by the host operating system.
  late String fsType;

  /// Specifies whether the volume is read-only.
  late bool readOnly;

  /// Reference to the secret containing the StorageOS API credentials.
  late LocalObjectReference secretRef;

  /// The name of the StorageOS volume.
  late String volumeName;

  /// The namespace of the StorageOS volume.
  late String volumeNamespace;

  /// Creates a [StorageOSVolumeSource] from a map of key-value pairs.
  /// 
  /// The [data] map must contain the keys 'fsType', 'readOnly', 'secretRef', 'volumeName', and 'volumeNamespace'.
  StorageOSVolumeSource.fromMap(Map<String, dynamic> data) {
    fsType = data['fsType'];
    readOnly = data['readOnly'];
    secretRef = LocalObjectReference.fromMap(data['secretRef']);
    volumeName = data['volumeName'];
    volumeNamespace = data['volumeNamespace'];
  }
}
