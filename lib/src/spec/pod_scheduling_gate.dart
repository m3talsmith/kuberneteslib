import 'package:json_annotation/json_annotation.dart';

part 'pod_scheduling_gate.g.dart';

/// Represents a scheduling gate for a Pod in Kubernetes.
///
/// PodSchedulingGate allows control over when a Pod can be scheduled by defining
/// gates that must be removed before scheduling. Key features include:
/// - Manual scheduling control
/// - Coordinated pod rollouts
/// - Deployment orchestration
/// - Scheduling prerequisites
///
/// Common use cases:
/// - Staged application rollouts
/// - Resource preparation
/// - Infrastructure readiness checks
/// - Maintenance windows
///
/// Example:
/// ```dart
/// final gate = PodSchedulingGate()
///   ..name = 'infrastructure-ready';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/scheduling-eviction/pod-scheduling-readiness/)
/// for more details about Pod scheduling gates.
@JsonSerializable()
class PodSchedulingGate {
  PodSchedulingGate();

  /// The name that identifies this scheduling gate.
  /// 
  /// This gate must be removed by name before the pod can be scheduled.
  /// Common patterns include:
  /// - 'infrastructure-ready': Infrastructure prerequisites
  /// - 'maintenance-window': Time-based scheduling control
  /// - 'resource-ready': Resource availability checks
  late String name;

  factory PodSchedulingGate.fromJson(Map<String, dynamic> json) =>
      _$PodSchedulingGateFromJson(json);

  Map<String, dynamic> toJson() => _$PodSchedulingGateToJson(this);
}
