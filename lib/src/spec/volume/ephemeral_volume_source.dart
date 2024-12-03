import '../persistent_volume_claim_template.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ephemeral_volume_source.g.dart';

/// Represents an ephemeral volume in Kubernetes that is dynamically provisioned.
///
/// EphemeralVolumeSource enables pods to use dynamically provisioned storage that
/// shares the pod's lifetime. Key features include:
/// - Dynamic volume provisioning
/// - Automatic cleanup with pod deletion
/// - PVC template specification
/// - Storage class integration
///
/// Common use cases:
/// - Temporary databases
/// - CI/CD build artifacts
/// - Data processing workloads
///
/// Example:
/// ```dart
/// final ephemeralVolume = EphemeralVolumeSource()
///   ..volumeClaimTemplate = PersistentVolumeClaimTemplate()
///     ..spec = PersistentVolumeClaimSpec()
///       ..accessModes = ['ReadWriteOnce']
///       ..resources = ResourceRequirements()
///         ..requests = {'storage': Quantity.fromString('10Gi')};
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/ephemeral-volumes/)
/// for more details about ephemeral volumes.
@JsonSerializable()
class EphemeralVolumeSource {
  EphemeralVolumeSource();

  /// PVC template for the ephemeral volume.
  /// 
  /// This template defines the PersistentVolumeClaim that will be automatically
  /// created and deleted with the pod. The claim is provisioned by the cluster's
  /// dynamic volume provisioner based on the specified storage class.
  late PersistentVolumeClaimTemplate volumeClaimTemplate;

  factory EphemeralVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$EphemeralVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$EphemeralVolumeSourceToJson(this);
}
