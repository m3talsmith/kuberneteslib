import 'package:json_annotation/json_annotation.dart';
import 'package:kuberneteslib/kuberneteslib.dart';

const _ignoreList = [
  ResourceKind.unknown,
  ResourceKind.container,
  ResourceKind.volume,
  ResourceKind.binding,
];

const _ignoreShow = [
  ..._ignoreList,
  ResourceKind.persistentVolume,
];

final _apiReadKinds = [
  ...ResourceKind.values.where((e) => !_ignoreList.contains(e)),
];

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
  cronJob,

  /// A job that runs a task to completion.
  job,

  /// A resource that manages a set of pods.
  podSet,

  /// A resource that manages a set of nodes.
  nodeSet,

  /// A resource that manages a set of namespaces.
  namespaceSet,

  /// A resource that manages a set of secrets.
  secretSet,

  /// A resource that manages a set of config maps.
  configMapSet,

  /// A resource that manages a set of services.
  serviceSet,

  /// A resource that manages a set of endpoints.
  endpointSet,

  /// A resource that manages a set of services.
  service,

  /// A resource that manages a set of config maps.
  configMap,

  /// A resource that manages a set of secrets.
  secret,

  /// A resource that manages a set of persistent volume claims.
  persistentVolumeClaim,

  /// A resource that manages a set of volumes.
  volumeSet,

  /// A resource that manages a set of events.
  eventSet,

  /// A resource that manages a set of custom resource definitions.
  customResourceDefinition,

  /// A resource that manages a set of limits.
  limitRange,

  /// A resource that manages a set of mutating webhooks.
  mutatingWebhookConfiguration,

  /// A resource that manages a set of validating webhooks.
  validatingWebhookConfiguration,

  /// A resource that manages a set of pod templates.
  podTemplate,

  /// A resource that manages a set of pod disruption budgets.
  podDisruptionBudget,

  /// A resource that manages a set of component statuses.
  componentStatus,

  /// A resource that manages a set of namespaces.
  namespace,

  /// A resource that manages a set of nodes.
  node,

  /// A resource that manages a set of resource quotas.
  resourceQuota,

  /// A resource that manages a set of services.
  serviceAccount,

  /// A resource that manages a set of events.
  event,

  /// A resource that manages a set of event series.
  eventSeries;

  /// Converts a string to a [ResourceKind].
  /// Returns [ResourceKind.unknown] if the string does not match any known resource kind.
  static ResourceKind fromString(String value) => ResourceKind.values.firstWhere((e) => e.name == value, orElse: () => ResourceKind.unknown);

  /// Returns a sorted list of resource kinds excluding [ResourceKind.unknown].
  static List<ResourceKind> sorted() => ResourceKind.values.where((e) => e != ResourceKind.unknown).toList();

  /// Returns a sorted list of resource kinds to ignore when listing resources.
  static List<ResourceKind> get ignoreList => _ignoreList..sort((a, b) => a.name.compareTo(b.name));

  /// Returns a sorted list of resource kinds to ignore when showing resources.
  static List<ResourceKind> get ignoreShow => _ignoreShow..sort((a, b) => a.name.compareTo(b.name));

  /// Returns a sorted list of resource kinds that are readable via the API.
  static List<ResourceKind> get apiReadKinds => _apiReadKinds..sort((a, b) => a.name.compareTo(b.name));
}
