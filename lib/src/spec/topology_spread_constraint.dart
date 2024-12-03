import 'package:json_annotation/json_annotation.dart';

import 'label_selector.dart';

part 'topology_spread_constraint.g.dart';

/// Represents a pod topology spread constraint in Kubernetes.
///
/// TopologySpreadConstraint controls how pods are distributed across failure
/// domains for high availability. Key features include:
/// - Workload distribution
/// - Failure domain awareness
/// - Scheduling flexibility
/// - Custom topology support
///
/// Common use cases:
/// - Zone-based distribution
/// - Node-level spreading
/// - Rack awareness
/// - Availability optimization
///
/// Example:
/// ```dart
/// final spread = TopologySpreadConstraint()
///   ..maxSkew = 1
///   ..topologyKey = 'kubernetes.io/zone'
///   ..whenUnsatisfiable = 'DoNotSchedule'
///   ..labelSelector = (LabelSelector()
///     ..matchLabels = {'app': 'web'});
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/scheduling-eviction/topology-spread-constraints/)
/// for more details about topology spread constraints.
@JsonSerializable()
class TopologySpreadConstraint {
  TopologySpreadConstraint();

  /// Selector to identify pods for spreading calculation.
  /// 
  /// Used to find matching pods when determining spread distribution.
  LabelSelector? labelSelector;

  /// Pod label keys to consider for spread calculation.
  /// 
  /// Alternative to labelSelector for simpler matching scenarios.
  List<String>? matchLabelKeys;

  /// Maximum allowed difference in pod count between domains.
  /// 
  /// For example, maxSkew=1 means domains can differ by at most 1 pod.
  int? maxSkew;

  /// Minimum number of domains pods should spread across.
  /// 
  /// Ensures pods are distributed across at least this many domains.
  int? minDomains;

  /// How to handle pod node affinity/selector in spread calculations.
  /// 
  /// Values: 'Honor', 'Ignore'
  String? nodeAffinityPolicy;

  /// How to handle node taints in spread calculations.
  /// 
  /// Values: 'Honor', 'Ignore'
  String? nodeTaintsPolicy;

  /// Node label key defining the topology domain.
  /// 
  /// Examples: 'topology.kubernetes.io/zone', 'kubernetes.io/hostname'
  String? topologyKey;

  /// Action when constraint cannot be satisfied.
  /// 
  /// Values:
  /// - 'DoNotSchedule': Prevents pod scheduling
  /// - 'ScheduleAnyway': Allows scheduling with best effort
  String? whenUnsatisfiable;

  factory TopologySpreadConstraint.fromJson(Map<String, dynamic> json) =>
      _$TopologySpreadConstraintFromJson(json);

  Map<String, dynamic> toJson() => _$TopologySpreadConstraintToJson(this);
}
