/// Represents a node selector requirement in Kubernetes.
/// 
/// A node selector requirement is a selector that contains values, an operator,
/// and a key. It is used to select nodes based on their labels.
class NodeSelectorRequirement {
  /// The label key that the selector applies to.
  late String key;

  /// Represents the operator that relates the key with values.
  /// Common operators include 'In', 'NotIn', 'Exists', 'DoesNotExist', etc.
  late String operator;

  /// The array of string values to select by.
  /// The operator determines how these values are used to select nodes.
  late List<String> values;

  /// Creates a [NodeSelectorRequirement] from a map structure.
  /// 
  /// The map must contain the following keys:
  /// * 'key': The label key
  /// * 'operator': The selection operator
  /// * 'values': The list of values to match against
  NodeSelectorRequirement.fromMap(Map<String, dynamic> data) {
    key = data['key'];
    operator = data['operator'];
    values = data['values'];
  }
}
