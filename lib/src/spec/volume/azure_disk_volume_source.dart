/// Represents an Azure Data Disk mount on the host.
class AzureDiskVolumeSource {
  /// The host caching mode: None, Read Only, Read Write.
  late String cachingMode;

  /// The name of the data disk in the Azure Portal.
  late String diskName;

  /// The URI of the data disk in the Azure Portal.
  late String diskURI;

  /// Filesystem type to mount (ex. 'ext4', 'xfs', 'ntfs').
  late String fsType;

  /// Kind of disk (Shared, Dedicated, Managed).
  late String kind;

  /// Whether to force the read-only setting in VolumeMounts.
  late bool readOnly;

  /// Creates a new [AzureDiskVolumeSource] instance from a map structure.
  AzureDiskVolumeSource.fromMap(Map<String, dynamic> data) {
    cachingMode = data['cachingMode'];
    diskName = data['diskName'];
    diskURI = data['diskURI'];
    fsType = data['fsType'];
    kind = data['kind'];
    readOnly = data['readOnly'];
  }
}
