/// Represents a Portworx volume source in Kubernetes.
/// 
/// Portworx is a software-defined storage solution that enables containerized 
/// applications to access persistent storage volumes.
class PortworxVolumeSource {
  /// The filesystem type to mount.
  /// 
  /// Must be a filesystem type supported by the host operating system.
  late String fsType;

  /// Controls whether the volume is mounted as read-only.
  /// 
  /// When true, the volume will be mounted as read-only.
  /// When false, the volume will be mounted with read-write permissions.
  late bool readOnly;

  /// Volume ID that uniquely identifies a Portworx volume.
  late String volumeID;

  /// Creates a new [PortworxVolumeSource] instance from a map structure.
  /// 
  /// The [data] parameter must contain the following keys:
  /// * 'fsType': String representing the filesystem type
  /// * 'readOnly': Boolean indicating read-only status
  /// * 'volumeID': String containing the Portworx volume ID
  PortworxVolumeSource.fromMap(Map<String, dynamic> data) {
    fsType = data['fsType'];
    readOnly = data['readOnly'];
    volumeID = data['volumeID'];
  }
}
