import 'package:json_annotation/json_annotation.dart';

import 'label_selector_requirement.dart';

part 'label_selector.g.dart';

/// Represents a label selector in Kubernetes.
///
/// LabelSelector enables filtering Kubernetes resources based on their labels using
/// two complementary selection mechanisms. Key features include:
/// - Expression-based matching
/// - Direct label matching
/// - Complex selection rules
/// - Multi-label filtering
///
/// Common use cases:
/// - Service pod selection
/// - Deployment targeting
/// - NetworkPolicy endpoints
/// - Resource affinity rules
///
/// Example:
/// ```dart
/// final selector = LabelSelector()
///   ..matchLabels = {
///     'environment': 'production',
///     'app': 'frontend'
///   }
///   ..matchExpressions = [
///     LabelSelectorRequirement()
///       ..key = 'tier'
///       ..operator = 'In'
///       ..values = ['frontend', 'middleware']
///   ];
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/)
/// for more details about label selectors.
@JsonSerializable()
class LabelSelector {
  LabelSelector(): matchExpressions = [], matchLabels = {};

  /// List of label selector requirements.
  /// 
  /// All requirements are ANDed together for filtering.
  /// Each requirement can specify a set-based selector using operators
  /// like In, NotIn, Exists, and DoesNotExist.
  final List<LabelSelectorRequirement>? matchExpressions;

  /// Map of string keys and values that must match exactly.
  /// 
  /// All key-value pairs are ANDed together with any matchExpressions.
  /// Each key must match the value exactly for the selector to match.
  final Map<String, LabelSelectorRequirement>? matchLabels;

  factory LabelSelector.fromJson(Map<String, dynamic> json) =>
      _$LabelSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$LabelSelectorToJson(this);
}
