/// Represents a Fibre Channel volume source in Kubernetes.
/// FC (Fibre Channel) volumes allow an existing FC volume to be mounted into a Pod.
class FCVolumeSource {
  /// Filesystem type to mount (e.g., 'ext4', 'xfs', 'ntfs').
  late String fsType;

  /// FC target lun number
  late int lun;

  /// Specifies whether the volume is read-only
  late bool readOnly;

  /// FC target worldwide names (WWN)
  late List<String> targetWWNs;

  /// FC volume world wide identifiers (wwids)
  late List<String> wwids;

  /// Creates a new FCVolumeSource instance from a map structure
  FCVolumeSource.fromMap(Map<String, dynamic> data) {
    fsType = data['fsType'];
    lun = data['lun'];
    readOnly = data['readOnly'];
    targetWWNs = data['targetWWNs'] as List<String>;
    wwids = data['wwids'] as List<String>;
  }
}
