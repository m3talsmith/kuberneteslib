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
  endpoints, unknown, volume, binding, persistentVolume, daemonSet, deployment, replicaSet, statefulSet, controllerRevision, cronJob,

  // ... existing enum values with their documentation ...
}
