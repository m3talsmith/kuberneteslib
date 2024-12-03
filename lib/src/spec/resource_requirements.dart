import 'package:json_annotation/json_annotation.dart';

import 'resource_claim.dart';

part 'resource_requirements.g.dart';

/// Represents resource requirements for containers and pods in Kubernetes.
///
/// ResourceRequirements defines compute and storage resources that a container/pod
/// needs or is allowed to use. Key features include:
/// - Resource requests (guaranteed minimums)
/// - Resource limits (enforced maximums)
/// - Resource claims (external resource bindings)
///
/// Common use cases:
/// - CPU allocation
/// - Memory management
/// - Storage provisioning
/// - GPU resource allocation
///
/// Example:
/// ```dart
/// final requirements = ResourceRequirements()
///   ..requests = {
///     'cpu': '500m',
///     'memory': '256Mi'
///   }
///   ..limits = {
///     'cpu': '1',
///     'memory': '512Mi'
///   }
///   ..claims = [
///     ResourceClaim()..name = 'gpu-claim'
///   ];
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)
/// for more details about resource requirements.
@JsonSerializable()
class ResourceRequirements {
  ResourceRequirements();

  /// Resource claims required by the container/pod.
  /// 
  /// Used to request external resources like GPUs or specialized hardware.
  @JsonKey(includeIfNull: false)
  List<ResourceClaim>? claims;

  /// Maximum resource limits enforced on the container/pod.
  /// 
  /// Common resources:
  /// - 'cpu': CPU cores (e.g., '1' = 1 core, '500m' = 0.5 cores)
  /// - 'memory': RAM (e.g., '256Mi', '1Gi')
  /// - 'ephemeral-storage': Temporary storage
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? limits;

  /// Minimum resource requests guaranteed to the container/pod.
  /// 
  /// Common resources:
  /// - 'cpu': CPU cores (e.g., '1' = 1 core, '500m' = 0.5 cores)
  /// - 'memory': RAM (e.g., '256Mi', '1Gi')
  /// - 'ephemeral-storage': Temporary storage
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? requests;

  factory ResourceRequirements.fromJson(Map<String, dynamic> json) =>
      _$ResourceRequirementsFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceRequirementsToJson(this);
}
