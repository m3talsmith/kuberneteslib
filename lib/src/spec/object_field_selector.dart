import 'package:json_annotation/json_annotation.dart';

part 'object_field_selector.g.dart';

/// Represents an ObjectFieldSelector in Kubernetes.
///
/// ObjectFieldSelector enables accessing fields of the pod and container through
/// the Downward API. Key features include:
/// - Pod metadata access
/// - Container information
/// - Status field selection
/// - Version-aware field paths
///
/// Common use cases:
/// - Pod name injection
/// - Namespace access
/// - Node name retrieval
/// - Pod IP address access
///
/// Example:
/// ```dart
/// final selector = ObjectFieldSelector()
///   ..apiVersion = 'v1'
///   ..fieldPath = 'metadata.namespace';
/// ```
///
/// Common field paths:
/// - `metadata.name`: Pod name
/// - `metadata.namespace`: Pod namespace
/// - `metadata.uid`: Pod UID
/// - `spec.nodeName`: Node name
/// - `status.podIP`: Pod IP address
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/workloads/pods/downward-api/)
/// for more details about the Downward API.
@JsonSerializable()
class ObjectFieldSelector {
  ObjectFieldSelector({this.apiVersion, this.fieldPath});

  /// API version of the referenced object.
  ///
  /// Typically 'v1' for core Kubernetes resources.
  /// Must match the API version of the referenced resource.
  String? apiVersion;

  /// Path to the desired field in the specified API version.
  ///
  /// Examples:
  /// - 'metadata.name': Pod name
  /// - 'metadata.namespace': Pod namespace
  /// - 'spec.nodeName': Node name
  /// - 'status.podIP': Pod IP address
  String? fieldPath;

  factory ObjectFieldSelector.fromJson(Map<String, dynamic> json) =>
      _$ObjectFieldSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectFieldSelectorToJson(this);
}
