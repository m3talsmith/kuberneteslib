import 'package:json_annotation/json_annotation.dart';

import 'node_selector_term.dart';

part 'preferred_scheduling_term.g.dart';

/// Represents a weighted node selector term for preferred pod scheduling in Kubernetes.
///
/// PreferredSchedulingTerm combines node selection preferences with weights to influence
/// pod scheduling decisions. Key features include:
/// - Weighted node selection
/// - Soft scheduling constraints
/// - Node affinity preferences
/// - Topology-aware scheduling
///
/// Common use cases:
/// - Preferred datacenter placement
/// - Hardware preference matching
/// - Cost optimization scheduling
/// - Performance-based placement
///
/// Example:
/// ```dart
/// final term = PreferredSchedulingTerm()
///   ..preference = (NodeSelectorTerm()
///     ..matchExpressions = [
///       NodeSelectorRequirement()
///         ..key = 'node-type'
///         ..operator = 'In'
///         ..values = ['gpu']
///     ])
///   ..weight = 80;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#node-affinity)
/// for more details about preferred scheduling terms.
@JsonSerializable()
class PreferredSchedulingTerm {
  PreferredSchedulingTerm();

  /// The node selector term that defines the scheduling preference.
  /// 
  /// Specifies a set of node selection criteria that the scheduler will try
  /// to satisfy. Unlike required terms, these are preferences rather than
  /// hard requirements.
  late NodeSelectorTerm preference;

  /// Weight factor for this preference (1-100).
  /// 
  /// The weight value defines the relative importance of this scheduling preference.
  /// Higher weights give the preference more significance in scheduling decisions.
  /// Typically ranges from 1 to 100, with higher values having more influence.
  late int weight;

  factory PreferredSchedulingTerm.fromJson(Map<String, dynamic> json) =>
      _$PreferredSchedulingTermFromJson(json);

  Map<String, dynamic> toJson() => _$PreferredSchedulingTermToJson(this);
}
