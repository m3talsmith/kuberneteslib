class GCEPersistentDiskVolumeSource {
  /// File system type to mount (e.g., 'ext4', 'xfs', 'ntfs')
  String? fsType;
  
  /// The partition in the volume that you want to mount (optional)
  int? partition;
  
  /// Unique name of the PD resource in GCE
  String pdName;
  
  /// Read-only if true, read-write otherwise
  bool? readOnly;

  GCEPersistentDiskVolumeSource.fromMap(Map<String, dynamic> data) {
    fsType = data['fsType'];
    partition = data['partition'];
    pdName = data['pdName'] ?? (throw ArgumentError('pdName is required'));
    readOnly = data['readOnly'];
  }

  Map<String, dynamic> toMap() => {
    if (fsType != null) 'fsType': fsType,
    if (partition != null) 'partition': partition,
    'pdName': pdName,
    if (readOnly != null) 'readOnly': readOnly,
  };
}
