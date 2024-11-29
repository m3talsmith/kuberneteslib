import 'node_selector_requirement.dart';

/// A node selector term represents a set of node selection criteria.
///
/// This class combines label-based and field-based selector requirements that can be used
/// to select nodes in a Kubernetes cluster. Both [matchExpressions] and [matchFields]
/// must be satisfied for a node to be selected.
///
/// Example:
/// ```dart
/// final term = NodeSelectorTerm.fromMap({
///   'matchExpressions': [
///     {'key': 'environment', 'operator': 'In', 'values': ['production']}
///   ],
///   'matchFields': [
///     {'key': 'metadata.name', 'operator': 'Exists'}
///   ]
/// });
/// ```
class NodeSelectorTerm {
  /// A list of label selector requirements that must be met.
  ///
  /// These requirements are based on node labels and are evaluated as a logical AND.
  /// If empty, this criterion is ignored.
  final List<NodeSelectorRequirement> matchExpressions;

  /// A list of node field selector requirements that must be met.
  ///
  /// These requirements are based on node fields (e.g., metadata.name) and are
  /// evaluated as a logical AND. If empty, this criterion is ignored.
  final List<NodeSelectorRequirement> matchFields;

  /// Creates a [NodeSelectorTerm] from a JSON-like map structure.
  ///
  /// The [data] map should contain:
  /// * 'matchExpressions': Optional list of label selector requirements
  /// * 'matchFields': Optional list of field selector requirements
  ///
  /// Both fields default to empty lists if not provided or null.
  /// The resulting lists are unmodifiable to prevent accidental modifications.
  NodeSelectorTerm.fromMap(Map<String, dynamic> data)
      : matchExpressions = List<NodeSelectorRequirement>.unmodifiable(
          (data['matchExpressions'] as List?)
                  ?.map((e) => NodeSelectorRequirement.fromMap(e as Map<String, dynamic>))
                  .toList() ??
              [],
        ),
        matchFields = List<NodeSelectorRequirement>.unmodifiable(
          (data['matchFields'] as List?)
                  ?.map((e) => NodeSelectorRequirement.fromMap(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );
}
