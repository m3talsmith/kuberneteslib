import 'package:json_annotation/json_annotation.dart';

part 'resource_claim.g.dart';

/// Represents a resource claim in Kubernetes.
///
/// ResourceClaim defines a request for specific resources that a pod requires.
/// Key features include:
/// - Resource allocation requests
/// - Dynamic resource provisioning
/// - Resource lifecycle management
/// - Pod resource binding
///
/// Common use cases:
/// - GPU allocation
/// - Network device requests
/// - Storage provisioning
/// - Custom resource claims
///
/// Example:
/// ```dart
/// final claim = ResourceClaim()
///   ..name = 'gpu-claim';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/workloads/pods/pod-resources/)
/// for more details about resource claims.
@JsonSerializable()
class ResourceClaim {
  ResourceClaim();

  /// The name that identifies this resource claim.
  ///
  /// This name is used to reference the claim when:
  /// - Binding resources to pods
  /// - Managing resource lifecycle
  /// - Tracking resource allocation
  /// - Cleaning up resources
  late String name;

  factory ResourceClaim.fromJson(Map<String, dynamic> json) =>
      _$ResourceClaimFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceClaimToJson(this);
}
