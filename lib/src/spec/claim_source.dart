import 'package:json_annotation/json_annotation.dart';

part 'claim_source.g.dart';

/// Represents a resource claim source configuration in Kubernetes.
///
/// ClaimSource enables pods to reference resource claims and templates for
/// dynamic resource allocation. Key features include:
/// - Resource claim referencing
/// - Template-based claim creation
/// - Dynamic resource provisioning
/// - Resource lifecycle management
///
/// Common use cases:
/// - Dynamic volume provisioning
/// - GPU resource allocation
/// - Network resource claims
/// - Custom resource claims
///
/// Example:
/// ```dart
/// final claimSource = ClaimSource()
///   ..resourceClaimName = 'storage-claim'
///   ..resourceClaimTemplate = 'fast-storage-template';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/workloads/pods/pod-resources/#resource-claims)
/// for more details about resource claims.
@JsonSerializable()
class ClaimSource {
  ClaimSource(): resourceClaimName = '', resourceClaimTemplate = '';

  /// The name of the resource claim to be used.
  /// 
  /// Required: Specifies an existing ResourceClaim to be used by the pod.
  /// The ResourceClaim must exist in the same namespace as the pod.
  final String resourceClaimName;

  /// The template for creating a new resource claim.
  /// 
  /// Required: References a ResourceClaimTemplate that will be used to create
  /// a new ResourceClaim for this pod.
  final String resourceClaimTemplate;

  factory ClaimSource.fromJson(Map<String, dynamic> json) =>
      _$ClaimSourceFromJson(json);

  Map<String, dynamic> toJson() => _$ClaimSourceToJson(this);
}
