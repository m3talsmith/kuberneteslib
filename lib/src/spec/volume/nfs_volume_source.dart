/// Represents a Network File System (NFS) volume source configuration.
/// 
/// This class is used to configure NFS volume mounts in Kubernetes,
/// containing essential information like the server address, path,
/// and read-only status.
class NFSVolumeSource {
  /// The path that is exported by the NFS server.
  late String path;

  /// Indicates whether the NFS volume should be mounted read-only.
  late bool readOnly;

  /// The hostname or IP address of the NFS server.
  late String server;

  /// Creates a new [NFSVolumeSource] instance from a map structure.
  /// 
  /// The [data] parameter should contain the following keys:
  /// * 'path': The exported path on the NFS server
  /// * 'readOnly': Boolean flag indicating read-only mount
  /// * 'server': The NFS server address
  NFSVolumeSource.fromMap(Map<String, dynamic> data) {
    path = data['path'];
    readOnly = data['readOnly'];
    server = data['server'];
  }
}
