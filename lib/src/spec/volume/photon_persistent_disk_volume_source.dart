/// Represents a Photon Controller persistent disk volume source.
/// 
/// This class is used to define the configuration for a VMware Photon Controller
/// persistent disk when used as a volume source in Kubernetes.
class PhotonPersistentDiskVolumeSource {
  /// The filesystem type to mount.
  /// 
  /// Must be a filesystem type supported by the host operating system.
  /// Examples: "ext4", "xfs", "ntfs".
  /// 
  /// This field is optional. If not specified, the default filesystem type
  /// configured in the Kubernetes cluster will be used.
  late String fsType;

  /// ID of the persistent disk resource in Photon Controller.
  /// 
  /// This ID uniquely identifies the Photon Controller persistent disk.
  /// The disk must already exist in the Photon Controller platform before
  /// it can be used as a volume source.
  /// 
  /// This field is required.
  late String pdID;

  /// Creates a new [PhotonPersistentDiskVolumeSource] instance from a map.
  /// 
  /// The [data] parameter must contain the following keys:
  /// - 'fsType': The filesystem type (optional)
  /// - 'pdID': The Photon Controller persistent disk ID (required)
  PhotonPersistentDiskVolumeSource.fromMap(Map<String, dynamic> data) {
    fsType = data['fsType'];
    pdID = data['pdID'];
  }
}
