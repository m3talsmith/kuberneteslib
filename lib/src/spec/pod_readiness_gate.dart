import 'package:json_annotation/json_annotation.dart';

part 'pod_readiness_gate.g.dart';

/// Represents a readiness gate condition for a Pod in Kubernetes.
///
/// PodReadinessGate allows defining custom readiness conditions that must be met
/// before a pod is considered ready. Key features include:
/// - Custom readiness conditions
/// - Application-specific health checks
/// - Complex deployment scenarios
/// - Coordinated rollouts
///
/// Common use cases:
/// - Application-specific readiness
/// - External dependency checks
/// - Custom health probes
/// - Staged rollouts
///
/// Example:
/// ```dart
/// final gate = PodReadinessGate()
///   ..conditionType = 'custom.io/app-ready';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#pod-readiness-gate)
/// for more details about Pod readiness gates.
@JsonSerializable()
class PodReadinessGate {
  PodReadinessGate();

  /// The condition type that must be true for pod readiness.
  /// 
  /// This field references a condition that will be added to the pod's conditions
  /// array. The pod will be considered ready only when the specified condition
  /// exists and is equal to "True". Common patterns include:
  /// - 'custom.io/app-ready': Application-specific readiness
  /// - 'example.com/feature-available': Feature availability
  /// - 'pod-ready': Basic pod readiness
  late String conditionType;

  factory PodReadinessGate.fromJson(Map<String, dynamic> json) =>
      _$PodReadinessGateFromJson(json);

  Map<String, dynamic> toJson() => _$PodReadinessGateToJson(this);
}
