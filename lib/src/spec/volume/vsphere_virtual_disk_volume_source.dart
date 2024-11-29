/// Represents a vSphere Virtual Disk Volume Source configuration.
/// 
/// This class defines the properties needed to configure a vSphere Virtual Disk
/// as a volume source in a Kubernetes cluster.
class VsphereVirtualDiskVolumeSource {
  /// The filesystem type to mount.
  /// 
  /// Common values include 'ext4', 'xfs', etc.
  late String fsType;

  /// The storage policy ID associated with the virtual disk.
  late String storagePolicyID;

  /// The name of the storage policy associated with the virtual disk.
  late String storagePolicyName;

  /// The path to the vSphere Virtual Disk volume.
  late String volumePath;

  /// Creates a new [VsphereVirtualDiskVolumeSource] instance from a map.
  /// 
  /// [data] should contain the following keys:
  /// * 'fsType': The filesystem type
  /// * 'storagePolicyID': The storage policy ID
  /// * 'storagePolicyName': The storage policy name
  /// * 'volumePath': The volume path
  VsphereVirtualDiskVolumeSource.fromMap(Map<String, dynamic> data) {
    fsType = data['fsType'];
    storagePolicyID = data['storagePolicyID'];
    storagePolicyName = data['storagePolicyName'];
    volumePath = data['volumePath'];
  }
}
