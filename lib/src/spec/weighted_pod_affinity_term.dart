import 'package:json_annotation/json_annotation.dart';

import 'pod_affinity_term.dart';

part 'weighted_pod_affinity_term.g.dart';

/// Represents a weighted pod affinity term in Kubernetes scheduling.
///
/// WeightedPodAffinityTerm enables defining pod affinity preferences with
/// different weights for scheduling decisions. Key features include:
/// - Weighted scheduling preferences
/// - Pod affinity rules
/// - Flexible topology constraints
/// - Priority-based placement
///
/// Common use cases:
/// - Co-located pod scheduling
/// - Workload distribution
/// - Availability zone balancing
/// - Service affinity rules
///
/// Example:
/// ```dart
/// final weightedTerm = WeightedPodAffinityTerm()
///   ..weight = 100
///   ..podAffinityTerm = (PodAffinityTerm()
///     ..topologyKey = 'kubernetes.io/hostname'
///     ..labelSelector = (LabelSelector()
///       ..matchLabels = {'app': 'cache'}));
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity)
/// for more details about pod affinity scheduling.
@JsonSerializable()
class WeightedPodAffinityTerm {
  WeightedPodAffinityTerm(): podAffinityTerm = PodAffinityTerm(), weight = 0;

  /// The pod affinity term associated with the weight.
  /// 
  /// Defines the matching criteria for pod affinity scheduling.
  final PodAffinityTerm podAffinityTerm;

  /// Weight associated with this pod affinity term.
  /// 
  /// Higher weights indicate stronger preferences in scheduling decisions.
  /// The weight must be in the range 1-100.
  final int weight;

  factory WeightedPodAffinityTerm.fromJson(Map<String, dynamic> json) =>
      _$WeightedPodAffinityTermFromJson(json);
  
  Map<String, dynamic> toJson() => _$WeightedPodAffinityTermToJson(this);
}
