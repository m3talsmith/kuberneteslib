import 'package:json_annotation/json_annotation.dart';

part 'label_selector_requirement.g.dart';

List<String>? _valuesFromJson(List<dynamic>? json) =>
    json?.map((e) => e as String).toList();

List<dynamic>? _valuesToJson(List<String>? instance) => instance?.toList();

/// Represents a label selector requirement in Kubernetes.
///
/// LabelSelectorRequirement defines a single rule for filtering Kubernetes resources
/// based on their labels. Key features include:
/// - Label key matching
/// - Multiple operator types
/// - Set-based selection
/// - Existence checking
///
/// Common use cases:
/// - Pod selection for services
/// - Workload targeting
/// - Resource filtering
/// - Node affinity rules
///
/// Example:
/// ```dart
/// final requirement = LabelSelectorRequirement()
///   ..key = 'environment'
///   ..operator = 'In'
///   ..values = ['production', 'staging'];
/// ```
///
/// Supported operators:
/// - `In`: Label value must match one of the specified values
/// - `NotIn`: Label value must not match any of the specified values
/// - `Exists`: Label key must exist (values are ignored)
/// - `DoesNotExist`: Label key must not exist (values are ignored)
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/)
/// for more details about label selectors.
@JsonSerializable()
class LabelSelectorRequirement {
  LabelSelectorRequirement({
    this.key,
    this.operator,
    this.values,
  });

  /// The label key that the selector applies to.
  ///
  /// Required: The name of the label key to match against.
  /// Must be a valid label key as per Kubernetes naming conventions.
  @JsonKey(includeIfNull: false)
  String? key;

  /// The operator representing the relationship between the key and values.
  ///
  /// Required: Must be one of: In, NotIn, Exists, DoesNotExist
  /// Determines how the selector matches labels.
  @JsonKey(includeIfNull: false)
  String? operator;

  /// The set of values to match against, depending on the operator.
  ///
  /// Required for In and NotIn operators.
  /// Must be empty for Exists and DoesNotExist operators.
  /// Values must be valid label values as per Kubernetes naming conventions.
  @JsonKey(
      includeIfNull: false, fromJson: _valuesFromJson, toJson: _valuesToJson)
  List<String>? values;

  factory LabelSelectorRequirement.fromJson(Map<String, dynamic> json) =>
      _$LabelSelectorRequirementFromJson(json);

  Map<String, dynamic> toJson() => _$LabelSelectorRequirementToJson(this);
}
