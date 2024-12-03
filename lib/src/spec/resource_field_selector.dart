import 'package:json_annotation/json_annotation.dart';

part 'resource_field_selector.g.dart';

/// Represents a selector for extracting resource values from containers in Kubernetes.
///
/// ResourceFieldSelector enables referencing container resource metrics and limits.
/// Key features include:
/// - Container resource selection
/// - Resource value extraction
/// - Value scaling/division
/// - Dynamic resource monitoring
///
/// Common use cases:
/// - Environment variable population
/// - Resource consumption monitoring
/// - Autoscaling configurations
/// - Resource quota enforcement
///
/// Example:
/// ```dart
/// final selector = ResourceFieldSelector()
///   ..containerName = 'web-server'
///   ..resource = 'memory'
///   ..divisor = '1Mi';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#resource-fields-as-environment-variables)
/// for more details about resource field selectors.
@JsonSerializable()
class ResourceFieldSelector {
  ResourceFieldSelector();

  /// The name of the container to extract the resource value from.
  /// 
  /// If omitted, the first container in the pod will be used.
  @JsonKey(includeIfNull: false)
  String? containerName;

  /// The divisor to apply to the resource value.
  /// 
  /// Common formats:
  /// - Memory: "1Mi", "1Gi"
  /// - CPU: "1m", "1"
  /// - Storage: "1Gi", "1Ti"
  @JsonKey(includeIfNull: false)
  dynamic divisor;

  /// The resource type to extract from the container.
  /// 
  /// Common values:
  /// - 'limits.cpu': CPU limit
  /// - 'requests.memory': Memory request
  /// - 'limits.ephemeral-storage': Storage limit
  @JsonKey(includeIfNull: false)
  String? resource;

  factory ResourceFieldSelector.fromMap(Map<String, dynamic> data) =>
      ResourceFieldSelector.fromJson(data);

  factory ResourceFieldSelector.fromJson(Map<String, dynamic> json) =>
      _$ResourceFieldSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceFieldSelectorToJson(this);
}
