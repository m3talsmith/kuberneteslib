import 'package:json_annotation/json_annotation.dart';

import 'label_selector_requirement.dart';

part 'label_selector.g.dart';

List<LabelSelectorRequirement>? _matchExpressionsFromJson(
        List<dynamic>? json) =>
    json
        ?.map(
            (e) => LabelSelectorRequirement.fromJson(e as Map<String, dynamic>))
        .toList();

List<Map<String, dynamic>>? _matchExpressionsToJson(
        List<LabelSelectorRequirement>? instance) =>
    instance?.map((e) => e.toJson()).toList();

Map<String, LabelSelectorRequirement>? _matchLabelsFromJson(
        Map<String, dynamic>? json) =>
    json?.map((key, value) => MapEntry(
        key, LabelSelectorRequirement.fromJson(value as Map<String, dynamic>)));

Map<String, dynamic>? _matchLabelsToJson(
        Map<String, LabelSelectorRequirement>? instance) =>
    instance?.map((key, value) => MapEntry(key, value.toJson()));

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
  LabelSelector({
    this.matchExpressions,
    this.matchLabels,
  });

  /// List of label selector requirements.
  ///
  /// All requirements are ANDed together for filtering.
  /// Each requirement can specify a set-based selector using operators
  /// like In, NotIn, Exists, and DoesNotExist.
  @JsonKey(
      includeIfNull: false,
      fromJson: _matchExpressionsFromJson,
      toJson: _matchExpressionsToJson)
  List<LabelSelectorRequirement>? matchExpressions;

  /// Map of string keys and values that must match exactly.
  ///
  /// All key-value pairs are ANDed together with any matchExpressions.
  /// Each key must match the value exactly for the selector to match.
  @JsonKey(
      includeIfNull: false,
      fromJson: _matchLabelsFromJson,
      toJson: _matchLabelsToJson)
  Map<String, LabelSelectorRequirement>? matchLabels;

  factory LabelSelector.fromJson(Map<String, dynamic> json) =>
      _$LabelSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$LabelSelectorToJson(this);
}
