import 'package:json_annotation/json_annotation.dart';

part 'node_selector_requirement.g.dart';

/// Represents a node selector requirement in Kubernetes.
///
/// NodeSelectorRequirement defines criteria for selecting nodes based on their
/// labels or fields. Key features include:
/// - Label-based selection
/// - Field-based selection
/// - Multiple operator support
/// - Value matching
///
/// Common use cases:
/// - Node affinity rules
/// - Topology constraints
/// - Hardware requirements
/// - Zone selection
///
/// Example:
/// ```dart
/// final requirement = NodeSelectorRequirement()
///   ..key = 'kubernetes.io/os'
///   ..operator = 'In'
///   ..values = ['linux'];
/// ```
///
/// Supported operators:
/// - `In`: Field value must match one of the specified values
/// - `NotIn`: Field value must not match any specified values
/// - `Exists`: Field must exist (values are ignored)
/// - `DoesNotExist`: Field must not exist (values are ignored)
/// - `Gt`: Field value must be greater than specified value
/// - `Lt`: Field value must be less than specified value
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/)
/// for more details about node selection.
@JsonSerializable()
class NodeSelectorRequirement {
  NodeSelectorRequirement()
      : key = '',
        operator = '',
        values = [];

  /// The label or field key that the selector applies to.
  /// 
  /// Examples:
  /// - 'kubernetes.io/os'
  /// - 'node.kubernetes.io/instance-type'
  /// - 'topology.kubernetes.io/zone'
  final String key;

  /// The operator that relates the key with values.
  /// 
  /// Must be one of: In, NotIn, Exists, DoesNotExist, Gt, Lt
  /// Determines how the requirement selects nodes.
  final String operator;

  /// The array of values to select nodes by.
  /// 
  /// The meaning depends on the operator:
  /// - For In and NotIn: List of values to match against
  /// - For Exists and DoesNotExist: Must be empty
  /// - For Gt and Lt: Must contain exactly one value
  final List<String> values;

  factory NodeSelectorRequirement.fromJson(Map<String, dynamic> json) =>
      _$NodeSelectorRequirementFromJson(json);

  Map<String, dynamic> toJson() => _$NodeSelectorRequirementToJson(this);
}
