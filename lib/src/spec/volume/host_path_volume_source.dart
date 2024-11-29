/// Represents a host path mapped into a pod.
/// Host path volumes do not support ownership management or SELinux relabeling.
class HostPathVolumeSource {
  /// Path of the directory on the host.
  /// If the path is a symlink, it will follow the link to the real path.
  late String path;

  /// Type for HostPath volume.
  /// Must be "", "DirectoryOrCreate", "Directory", "FileOrCreate", "File",
  /// "Socket", "CharDevice" or "BlockDevice"
  late String type;

  /// Creates a new [HostPathVolumeSource] instance from a map structure.
  HostPathVolumeSource.fromMap(Map<String, dynamic> data) {
    path = data['path'];
    type = data['type'];
  }
}
