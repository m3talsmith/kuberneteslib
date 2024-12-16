import 'package:json_annotation/json_annotation.dart';

part 'container_resize_policy.g.dart';

/// Represents a container resize policy in Kubernetes.
///
/// ContainerResizePolicy defines how container resources can be dynamically adjusted.
/// Key features include:
/// - Resource-specific resize rules
/// - Restart behavior control
/// - Dynamic resource allocation
/// - Container lifecycle management
///
/// Common use cases:
/// - Vertical scaling of resources
/// - Memory limit adjustments
/// - CPU quota modifications
/// - Dynamic resource optimization
///
/// Example:
/// ```dart
/// final resizePolicy = ContainerResizePolicy()
///   ..resourceName = 'memory'
///   ..restartPolicy = 'NotRequired';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)
/// for more details about container resource management.
@JsonSerializable()
class ContainerResizePolicy {
  ContainerResizePolicy();

  /// The name of the resource that can be resized.
  ///
  /// Required: Specifies which resource (e.g., 'cpu', 'memory') this policy applies to.
  /// Must match the resource name in the container's resource requirements.
  late String resourceName;

  /// The restart policy after a resize operation.
  ///
  /// Required: Defines whether and how the container should restart after resizing.
  /// Valid values:
  /// - "NotRequired": No restart needed after resize
  /// - "RestartContainer": Container will restart after resize
  late String restartPolicy;

  factory ContainerResizePolicy.fromJson(Map<String, dynamic> json) =>
      _$ContainerResizePolicyFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerResizePolicyToJson(this);
}
