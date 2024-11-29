/// Represents a volume mount configuration in a container.
///
/// VolumeMount describes a mounting of a Volume within a container.
/// It specifies the path where the volume should be mounted, along with
/// various mounting options and configurations.
class VolumeMount {
  /// Path within the container at which the volume should be mounted.
  String? mountPath;

  /// Determines how mounts are propagated from the host to container and vice versa.
  /// Can be one of: None, HostToContainer, Bidirectional.
  String? mountPropagation;

  /// The name of the volume to mount.
  /// This must match the name of a volume defined in the pod's volumes list.
  String? name;

  /// Mounted read-only if true, read-write otherwise (false or unspecified).
  bool? readOnly;

  /// Path within the volume from which the container's volume should be mounted.
  String? subPath;

  /// Expanded path within the volume from which the container's volume should be mounted.
  /// Behaves similarly to subPath but environment variable references are expanded.
  String? subPathExpr;

  /// Creates a new [VolumeMount] instance from a map of data.
  ///
  /// The map should contain string keys corresponding to the field names
  /// and appropriate values for each field.
  VolumeMount.fromMap(Map<String, dynamic> data) {
    mountPath = data['mountPath'];
    mountPropagation = data['mountPropagation'];
    name = data['name'];
    readOnly = data['readOnly'];
    subPath = data['subPath'];
    subPathExpr = data['subPathExpr'];
  }
}
