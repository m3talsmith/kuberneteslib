import 'package:json_annotation/json_annotation.dart';

import 'node_selector_term.dart';

part 'node_selector.g.dart';

/// Represents a node selector in Kubernetes.
///
/// NodeSelector defines a set of criteria for selecting nodes where pods can be scheduled.
/// Key features include:
/// - Multiple term support
/// - AND logic between terms
/// - Label-based selection
/// - Field-based selection
///
/// Common use cases:
/// - Hardware requirements
/// - Zone/region selection
/// - Operating system constraints
/// - Resource availability filtering
///
/// Example:
/// ```dart
/// final selector = NodeSelector()
///   ..nodeSelectorTerms = [
///     NodeSelectorTerm()
///       ..matchExpressions = [
///         NodeSelectorRequirement()
///           ..key = 'kubernetes.io/os'
///           ..operator = 'In'
///           ..values = ['linux']
///       ]
///       ..matchFields = [
///         NodeSelectorRequirement()
///           ..key = 'metadata.name'
///           ..operator = 'NotIn'
///           ..values = ['maintenance-node']
///       ]
///   ];
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/)
/// for more details about node selection.
@JsonSerializable()
class NodeSelector {
  NodeSelector() : nodeSelectorTerms = [];

  /// List of node selector terms that define the selection criteria.
  /// 
  /// Each term is evaluated independently, and the node must match all requirements
  /// within at least one term to be selected. Terms are combined using OR logic,
  /// while requirements within each term use AND logic.
  List<NodeSelectorTerm> nodeSelectorTerms;

  factory NodeSelector.fromJson(Map<String, dynamic> json) => _$NodeSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$NodeSelectorToJson(this);
}
