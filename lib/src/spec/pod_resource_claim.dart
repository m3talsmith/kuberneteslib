import 'package:json_annotation/json_annotation.dart';

import 'claim_source.dart';

part 'pod_resource_claim.g.dart';

/// Represents a resource claim for a Pod in Kubernetes.
///
/// PodResourceClaim enables pods to request specific resources that are managed
/// through the ResourceClaim API. Key features include:
/// - Dynamic resource allocation
/// - Resource lifecycle management
/// - Pod-level resource requests
/// - Resource sharing configuration
///
/// Common use cases:
/// - GPU allocation
/// - FPGA resources
/// - Custom device claims
/// - Specialized hardware access
///
/// Example:
/// ```dart
/// final resourceClaim = PodResourceClaim()
///   ..name = 'gpu-claim'
///   ..source = (ClaimSource()
///     ..resourceClaimName = 'shared-gpu');
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/workloads/pods/pod-resource-claims/)
/// for more details about Pod resource claims.
ClaimSource? _sourceFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ClaimSource.fromJson(json);

Map<String, dynamic>? _sourceToJson(ClaimSource? instance) =>
    instance?.toJson();

@JsonSerializable()
class PodResourceClaim {
  PodResourceClaim();

  /// The name that uniquely identifies this resource claim within the pod.
  ///
  /// This name is used to reference the claim from container specifications
  /// and must be unique within the pod.
  @JsonKey(includeIfNull: false)
  String? name;

  /// The source configuration for obtaining this resource.
  ///
  /// Specifies how the resource should be allocated or referenced,
  /// such as from an existing ResourceClaim or created dynamically.
  @JsonKey(
      includeIfNull: false, fromJson: _sourceFromJson, toJson: _sourceToJson)
  ClaimSource? source;

  factory PodResourceClaim.fromJson(Map<String, dynamic> json) =>
      _$PodResourceClaimFromJson(json);

  Map<String, dynamic> toJson() => _$PodResourceClaimToJson(this);
}
