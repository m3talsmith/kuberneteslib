import '../../spec/local_object_reference.dart';

/// Represents a Cinder volume source in OpenStack.
/// 
/// Cinder is OpenStack's block storage service that provides persistent block storage
/// to virtual machines.
class CinderVolumeSource {
  /// The filesystem type to mount.
  /// 
  /// Must be a filesystem type supported by the host operating system.
  late String fsType;

  /// Determines if the volume should be mounted read-only.
  /// 
  /// When true, the volume will be mounted as read-only.
  late bool readOnly;

  /// Reference to the secret containing credentials needed for accessing the Cinder service.
  late LocalObjectReference secretRef;

  /// The unique identifier for the volume in Cinder.
  /// 
  /// This ID is used to identify the specific volume to mount.
  late String volumeID;

  /// Creates a [CinderVolumeSource] from a map of data.
  /// 
  /// The map must contain the following keys:
  /// - 'fsType': String
  /// - 'readOnly': bool
  /// - 'secretRef': Map for [LocalObjectReference]
  /// - 'volumeID': String
  CinderVolumeSource.fromMap(Map<String, dynamic> data) {
    fsType = data['fsType'];
    readOnly = data['readOnly'];
    secretRef = LocalObjectReference.fromMap(data['secretRef']);
    volumeID = data['volumeID'];
  }
}
