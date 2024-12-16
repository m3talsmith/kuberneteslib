import 'package:json_annotation/json_annotation.dart';

import 'node_selector_requirement.dart';

part 'node_selector_term.g.dart';

List<NodeSelectorRequirement>? _nodeSelectorRequirementFromJson(
        List<dynamic>? json) =>
    json
        ?.map(
            (e) => NodeSelectorRequirement.fromJson(e as Map<String, dynamic>))
        .toList();

List<Map<String, dynamic>>? _nodeSelectorRequirementToJson(
        List<NodeSelectorRequirement>? requirements) =>
    requirements?.map((e) => e.toJson()).toList();

/// Represents a node selector term in Kubernetes.
///
/// NodeSelectorTerm combines multiple node selection requirements into a single term.
/// Key features include:
/// - Label-based node selection
/// - Field-based node selection
/// - AND logic between requirements
/// - Support for multiple selection criteria
///
/// Common use cases:
/// - Node affinity rules
/// - Topology constraints
/// - Hardware requirements
/// - Zone selection
///
/// Example:
/// ```dart
/// final term = NodeSelectorTerm()
///   ..matchExpressions = [
///     NodeSelectorRequirement()
///       ..key = 'kubernetes.io/os'
///       ..operator = 'In'
///       ..values = ['linux'],
///     NodeSelectorRequirement()
///       ..key = 'node.kubernetes.io/instance-type'
///       ..operator = 'In'
///       ..values = ['c5.xlarge', 'c5.2xlarge']
///   ]
///   ..matchFields = [
///     NodeSelectorRequirement()
///       ..key = 'metadata.name'
///       ..operator = 'NotIn'
///       ..values = ['node-maintenance']
///   ];
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/)
/// for more details about node selection.
@JsonSerializable()
class NodeSelectorTerm {
  NodeSelectorTerm({
    this.matchExpressions,
    this.matchFields,
  });

  /// A list of node label selector requirements.
  ///
  /// These requirements are based on node labels and are evaluated as a logical AND.
  /// Each requirement specifies a key, operator, and values for matching node labels.
  /// If empty, this criterion is ignored.
  @JsonKey(
      includeIfNull: false,
      fromJson: _nodeSelectorRequirementFromJson,
      toJson: _nodeSelectorRequirementToJson)
  List<NodeSelectorRequirement>? matchExpressions;

  /// A list of node field selector requirements.
  ///
  /// These requirements are based on node fields (e.g., metadata.name,
  /// metadata.namespace) and are evaluated as a logical AND. Each requirement
  /// specifies a key, operator, and values for matching node fields.
  /// If empty, this criterion is ignored.
  @JsonKey(
      includeIfNull: false,
      fromJson: _nodeSelectorRequirementFromJson,
      toJson: _nodeSelectorRequirementToJson)
  List<NodeSelectorRequirement>? matchFields;

  factory NodeSelectorTerm.fromJson(Map<String, dynamic> json) =>
      _$NodeSelectorTermFromJson(json);

  Map<String, dynamic> toJson() => _$NodeSelectorTermToJson(this);
}
