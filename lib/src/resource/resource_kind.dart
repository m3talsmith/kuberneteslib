import 'package:json_annotation/json_annotation.dart';
import 'package:kuberneteslib/kuberneteslib.dart';

/// Represents the different types of resources available in the Kubernetes API.
///
/// ResourceKind defines all supported Kubernetes resource types that can be
/// managed through this library. Resources are grouped by their API group:
/// - Core API (/api/v1)
/// - Apps API (/apis/apps/v1)
/// - Batch API (/apis/batch/v1)
///
/// Some resource kinds (like Container and Volume) are included for completeness
/// but are typically ignored in API operations. See [Resource.ignoreList] for
/// details about which resources are ignored.
///
/// Example usage:
/// ```dart
/// final kind = ResourceKind.pod;
/// final resource = Resource(kind: kind);
/// ```
///
/// Common resource kinds:
/// - [pod]: Basic unit of deployment
/// - [deployment]: Manages ReplicaSets and Pods
/// - [service]: Network endpoint for Pods
/// - [configMap]: Configuration storage
/// - [secret]: Sensitive data storage
@JsonEnum()
enum ResourceKind {
  // Core API Resources (/api/v1)
  /// A container within a Pod, the smallest unit of compute.
  /// Note: Usually ignored in API operations.
  container,

  /// The smallest deployable unit in Kubernetes.
  /// Represents one or more containers that share resources.
  pod,

  /// Ensures a specified number of pod replicas are running.
  /// Legacy controller type, prefer Deployments for new workloads.
  replicationController,

  /// Network endpoints for a Service.
  /// Tracks the IPs and ports for a set of Pods.
  endpoints,

  /// Unknown resource kind.
  unknown,

  /// A storage unit that can be mounted to a pod.
  volume,

  /// A binding is used to bind a pod to a node.
  binding,

  /// A persistent storage resource in Kubernetes.
  persistentVolume,

  /// A controller that ensures a set of nodes run a copy of a pod.
  daemonSet,

  /// A controller that manages a set of identical pods.
  deployment,

  /// A controller that manages a set of pod replicas.
  replicaSet,

  /// A controller that manages pods with unique identities.
  statefulSet,

  /// A revision of a controller's state.
  controllerRevision,

  /// A job that runs on a schedule.
  cronJob;

  /// Converts a string to a [ResourceKind].
  /// Returns [ResourceKind.unknown] if the string does not match any known resource kind.
  static ResourceKind fromString(String value) => ResourceKind.values.firstWhere((e) => e.name == value, orElse: () => ResourceKind.unknown);
}
