/// Represents a GlusterFS volume source in Kubernetes.
/// GlusterFS volumes allow an existing GlusterFS volume to be mounted into a Pod.
class GlusterfsVolumeSource {
  /// EndpointName is the endpoint name that details GlusterFS topology
  late String endpoint;

  /// Path to the GlusterFS volume inside the container
  late String path;

  /// Specifies whether the volume is read-only
  late bool readOnly;

  /// Creates a new GlusterfsVolumeSource instance from a map structure
  GlusterfsVolumeSource.fromMap(Map<String, dynamic> data) {
    endpoint = data['endpoint'];
    path = data['path'];
    readOnly = data['readOnly'];
  }
}
