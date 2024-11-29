import 'package:kuberneteslib/kuberneteslib.dart';

/// ResourceKind stores all the resource kinds the library supports. This is
/// used later by [Resource.getApi] to determine what API path to use in the
/// Kubernetes API call.
///
/// The enum is organized by API groups:
/// * Core API (`v1`) - Basic Kubernetes resources like Pods, Services, ConfigMaps
/// * Batch API (`batch/v1`) - Job-related resources like Jobs and CronJobs
/// * Apps API (`apps/v1`) - Application deployment resources like Deployments and StatefulSets
///
/// API Paths:
/// - Core API resources use: `/api/v1`
/// - Batch API resources use: `/apis/batch/v1`
/// - Apps API resources use: `/apis/apps/v1`
///
/// Usage:
/// ```dart
/// // Direct usage
/// final kind = ResourceKind.pod;
/// 
/// // Convert from string
/// final fromString = ResourceKind.fromString('pod'); // Returns ResourceKind.pod
/// final unknown = ResourceKind.fromString('invalid'); // Returns ResourceKind.unknown
/// 
/// // Used with Resource API
/// final resources = await Resource.list(
///   auth: auth,
///   resourceKind: ResourceKind.pod.name,
/// );
/// ```
///
/// Note: Some resource kinds like [ResourceKind.container] and [ResourceKind.volume]
/// are included for completeness but are typically ignored in API operations
/// (see [Resource.ignoreList]).
enum ResourceKind {
  // coreAPI
  /// Represents a Container within a Pod
  container,
  
  /// Represents a Pod, the smallest deployable unit in Kubernetes
  pod,
  
  /// Represents a ReplicationController, ensures specified number of pod replicas are running
  replicationController,
  
  /// Represents Endpoints, defines network endpoints for a Service
  endpoints,
  
  /// Represents a Service, an abstract way to expose an application running on pods
  service,
  
  /// Represents a ConfigMap, stores non-confidential configuration data
  configMap,
  
  /// Represents a Secret, stores sensitive information like passwords and tokens
  secret,
  
  /// Represents a PersistentVolumeClaim, requests for storage by a pod
  persistentVolumeClaim,
  
  /// Represents a Volume, storage that can be mounted into a pod
  volume,
  
  /// Represents a LimitRange, enforces resource constraints in a namespace
  limitRange,
  
  /// Represents a PodTemplate, template for creating pods
  podTemplate,
  
  /// Represents a Binding, binds a pod to a node
  binding,
  
  /// Represents ComponentStatus, status of cluster components
  componentStatus,
  
  /// Represents a Namespace, virtual cluster within a physical cluster
  namespace,
  
  /// Represents a Node, a worker machine in the cluster
  node,
  
  /// Represents a PersistentVolume, piece of storage in the cluster
  persistentVolume,
  
  /// Represents ResourceQuota, constraints resource consumption per namespace
  resourceQuota,
  
  /// Represents ServiceAccount, provides identity for processes in pods
  serviceAccount,

  // batchAPI
  /// Represents a CronJob, creates Jobs on a schedule
  cronJob,
  
  /// Represents a Job, runs pods to completion
  job,

  // appsAPI
  /// Represents a DaemonSet, ensures pods run on all or some nodes
  daemonSet,
  
  /// Represents a Deployment, declarative updates for Pods and ReplicaSets
  deployment,
  
  /// Represents a ReplicaSet, maintains stable set of replica Pods
  replicaSet,
  
  /// Represents a StatefulSet, manages stateful applications
  statefulSet,
  
  /// Represents ControllerRevision, tracks revisions of StatefulSets and DaemonSets
  controllerRevision,

  // Error
  /// Represents an unknown resource kind
  unknown;

  const ResourceKind();

  /// Creates a [ResourceKind] from a string representation.
  /// 
  /// Returns [ResourceKind.unknown] if the string doesn't match any known kind.
  /// 
  /// Example:
  /// ```dart
  /// final pod = ResourceKind.fromString('pod'); // Returns ResourceKind.pod
  /// final unknown = ResourceKind.fromString('invalid'); // Returns ResourceKind.unknown
  /// ```
  factory ResourceKind.fromString(String kind) {
    return ResourceKind.values.firstWhere(
      (e) => e.name == kind,
      orElse: () => ResourceKind.unknown,
    );
  }
}
