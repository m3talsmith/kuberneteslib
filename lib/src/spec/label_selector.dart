import 'label_selector_requirement.dart';

/// A selector that matches labels based on expressions and direct label matches.
///
/// LabelSelector is used to filter objects based on their labels. It supports two types
/// of selection criteria:
/// * matchExpressions: A list of label selector requirements
/// * matchLabels: A map of key-value pairs for direct label matching
class LabelSelector {
  /// List of label selector requirements that must be met
  List<LabelSelectorRequirement>? matchExpressions;

  /// Map of label key-value pairs that must match exactly
  Map<String, LabelSelectorRequirement>? matchLabels;

  /// Creates a LabelSelector from a map structure
  ///
  /// [data] should contain:
  /// * 'matchExpressions': List of maps defining label selector requirements
  /// * 'matchLabels': Map of label key-value pairs
  LabelSelector.fromMap(Map<String, dynamic> data) {
    if (data['matchExpressions'] != null) {
      matchExpressions =
          (data['matchExpressions'] as List<Map<String, dynamic>>)
              .map(
                (e) => LabelSelectorRequirement.fromMap(e),
              )
              .toList();
    }
    if (data['matchLabels'] != null) {
      matchLabels = {};
      for (var e in (data['matchLabels'] as Map<String, dynamic>).entries) {
        final req = (e.value is String)
            ? LabelSelectorRequirement(key: e.key, values: [e.value])
            : LabelSelectorRequirement.fromMap(e.value);
        matchLabels![e.key] = req;
      }
    }
  }

  Map<String, dynamic> toMap() => {
        'matchExpressions': (matchExpressions != null)
            ? matchExpressions!.map(
                (e) => e.toMap(),
              )
            : null,
        'matchLabels': (matchLabels != null && matchLabels!.entries.isNotEmpty)
            ? matchLabels!.entries.fold(
                <String, dynamic>{},
                (previousValue, e) => previousValue[e.key] = e.value.toMap(),
              )
            : null,
      };
}
