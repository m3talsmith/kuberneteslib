import 'node_selector_term.dart';

/// Represents a preferred scheduling term that combines a node selector preference with a weight.
/// This is typically used in pod scheduling to express scheduling preferences rather than hard requirements.
class PreferredSchedulingTerm {
  /// The node selector term associated with the scheduling preference.
  late NodeSelectorTerm preference;

  /// The weight associated with this scheduling term.
  /// Higher weights indicate stronger preferences, typically in the range of 1-100.
  late int weight;

  /// Creates a [PreferredSchedulingTerm] from a map structure.
  /// 
  /// The map must contain:
  /// * 'preference': A map that can be converted to a [NodeSelectorTerm]
  /// * 'weight': An integer value representing the weight of this preference
  PreferredSchedulingTerm.fromMap(Map<String, dynamic> data) {
    preference = NodeSelectorTerm.fromMap(data['preference']);
    weight = data['weight'];
  }
}
