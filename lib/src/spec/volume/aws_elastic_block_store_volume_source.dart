/// Represents a persistent volume source from AWS Elastic Block Store (EBS).
class AWSElasticBlockStoreVolumeSource {
  /// File system type to mount.
  /// Must be a filesystem type supported by the host operating system.
  /// Examples: "ext4", "xfs", "ntfs".
  late String fsType;

  /// The partition in the volume that you want to mount (optional).
  late int partition;

  /// Specify "true" to force and set the ReadOnly property in VolumeMounts to "true".
  /// Defaults to false.
  late bool readOnly;

  /// Unique ID of the EBS volume.
  /// Example: "vol-1234567890abcdef0"
  late String volumeID;

  AWSElasticBlockStoreVolumeSource.fromMap(Map<String, dynamic> data) {
    fsType = data['fsType'];
    partition = data['partition'];
    readOnly = data['readOnly'];
    volumeID = data['volumeID'];
  }
}
