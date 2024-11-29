import '../persistent_volume_claim_template.dart';

/// Represents an ephemeral volume source in Kubernetes.
///
/// Ephemeral volumes are temporary volumes that exist for the lifetime of a pod.
/// They are created when a pod is created and deleted when the pod is removed.
///
/// Example usage:
/// ```dart
/// var ephemeralVolume = EphemeralVolumeSource.fromMap({
///   'volumeClaimTemplate': {
///     'spec': {
///       'accessModes': ['ReadWriteOnce'],
///       'resources': {
///         'requests': {'storage': '1Gi'}
///       }
///     }
///   }
/// });
/// ```
class EphemeralVolumeSource {
  /// The volume claim template that defines the ephemeral volume.
  ///
  /// This template is used to create a PersistentVolumeClaim when the pod
  /// is created. The claim is deleted when the pod is deleted.
  late PersistentVolumeClaimTemplate volumeClaimTemplate;

  /// Creates a new [EphemeralVolumeSource] instance from a map structure.
  /// 
  /// Parameters:
  ///   [data] - Map containing the ephemeral volume configuration:
  ///     - 'volumeClaimTemplate': The PVC template configuration
  ///
  /// Throws:
  ///   [ArgumentError] if the volumeClaimTemplate is missing or invalid
  EphemeralVolumeSource.fromMap(Map<String, dynamic> data) {
    volumeClaimTemplate =
        PersistentVolumeClaimTemplate.fromMap(data['volumeClaimTemplate']);
  }
}
