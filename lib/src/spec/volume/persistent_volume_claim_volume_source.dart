/// Represents a reference to a PersistentVolumeClaim in the same namespace.
/// PersistentVolumeClaims are a way to claim durable storage in a Kubernetes cluster.
class PersistentVolumeClaimVolumeSource {
  /// The name of the PersistentVolumeClaim in the pod's namespace to use.
  /// This field is required.
  String? claimName;

  /// Mounted read-only if true, read-write otherwise (false or unspecified).
  /// Defaults to false.
  bool? readOnly;

  /// Creates a new [PersistentVolumeClaimVolumeSource] instance from a map structure.
  /// 
  /// The [data] parameter should contain the following keys:
  /// - 'claimName': String value representing the name of the PVC
  /// - 'readOnly': Boolean value indicating if the volume should be mounted read-only
  PersistentVolumeClaimVolumeSource.fromMap(Map<String, dynamic> data) {
    claimName = data['claimName'];
    readOnly = data['readOnly'];
  }
}
