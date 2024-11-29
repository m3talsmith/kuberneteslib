/// A representation of a Kubernetes label selector requirement.
/// 
/// Label selector requirements are used to filter Kubernetes resources based on
/// their labels. Each requirement consists of a key, an operator, and a set of values.
class LabelSelectorRequirement {
  LabelSelectorRequirement({this.key, this.operator, this.values,});
  /// The label key that the selector applies to.
  String? key;

  /// The operator representing the relationship between the key and values.
  /// 
  /// Common operators include:
  /// - In: label's value should be among the specified values
  /// - NotIn: label's value should not be among the specified values
  /// - Exists: label should exist
  /// - DoesNotExist: label should not exist
  String? operator;

  /// The set of values to match against, depending on the [operator].
  /// 
  /// For operators like 'In' and 'NotIn', this list contains the allowed/disallowed values.
  /// For 'Exists' and 'DoesNotExist' operators, this list is typically empty.
  List<String>? values;

  /// Creates a [LabelSelectorRequirement] from a Map representation.
  /// 
  /// The map should contain the following keys:
  /// - 'key': String representing the label key
  /// - 'operator': String representing the operator
  /// - 'values': List<String> representing the values to match against
  LabelSelectorRequirement.fromMap(Map<String, dynamic> data) {
    key = data['key'];
    operator = data['operator'];
    values = data['values'];
  }
}
