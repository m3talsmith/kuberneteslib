import 'node_selector_term.dart';

/// A node selector represents the union of the results of one or more node selector terms.
/// 
/// Node selectors are used to specify a set of node attributes that a pod should run on.
/// The node selector is conceptually equivalent to an AND operation across all terms.
class NodeSelector {
  /// List of node selector terms that define the selector criteria.
  /// 
  /// All terms must be satisfied for a node to be selected.
  late List<NodeSelectorTerm> nodeSelectorTerms;

  /// Creates a [NodeSelector] instance from a map representation.
  /// 
  /// The [data] parameter should contain a 'nodeSelectorTerms' key with a list
  /// of maps, where each map represents a [NodeSelectorTerm].
  /// 
  /// Example:
  /// ```dart
  /// final selector = NodeSelector.fromMap({
  ///   'nodeSelectorTerms': [
  ///     {'matchExpressions': [...], 'matchFields': [...]}
  ///   ]
  /// });
  /// ```
  NodeSelector.fromMap(Map<String, dynamic> data) {
    nodeSelectorTerms =
        (data['nodeSelectorTerms'] as List<Map<String, dynamic>>)
            .map(
              (e) => NodeSelectorTerm.fromMap(e),
            )
            .toList();
  }
}
