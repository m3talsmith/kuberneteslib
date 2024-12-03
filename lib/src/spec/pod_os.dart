import 'package:json_annotation/json_annotation.dart';

part 'pod_os.g.dart';

/// Represents the operating system configuration for a Pod in Kubernetes.
///
/// PodOS specifies the operating system that the pod and its containers will run on.
/// Key features include:
/// - OS selection for pods
/// - Container runtime compatibility
/// - Node scheduling constraints
/// - Platform-specific features
///
/// Common use cases:
/// - Windows container workloads
/// - Linux container workloads
/// - Mixed OS cluster management
/// - Platform-specific deployments
///
/// Example:
/// ```dart
/// final podOS = PodOS()
///   ..name = 'windows';  // or 'linux'
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/workloads/pods/#pod-os)
/// for more details about Pod operating system configuration.
@JsonSerializable()
class PodOS {
  PodOS();

  /// The name of the operating system for the pod.
  /// 
  /// Supported values:
  /// - 'linux': Linux-based containers (default)
  /// - 'windows': Windows-based containers
  /// 
  /// This field is used by the scheduler to select nodes with matching
  /// operating systems. Must match the OS field in the node specification.
  late String name;

  factory PodOS.fromJson(Map<String, dynamic> json) => _$PodOSFromJson(json);

  Map<String, dynamic> toJson() => _$PodOSToJson(this);
}
