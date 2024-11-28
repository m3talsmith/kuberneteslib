import 'package:kuberneteslib/kuberneteslib.dart';

/// ResourceKind stores all the resource kinds the library supports. This is
/// used later by [Resource.getApi] to determine what API path to use in the
/// Kubernetes API call.
enum ResourceKind {
  // coreAPI
  container,
  pod,
  replicationController,
  endpoints,
  service,
  configMap,
  secret,
  persistentVolumeClaim,
  volume,
  limitRange,
  podTemplate,
  binding,
  componentStatus,
  namespace,
  node,
  persistentVolume,
  resourceQuota,
  serviceAccount,
  // batchAPI
  cronJob,
  job,
  // appsAPI
  daemonSet,
  deployment,
  replicaSet,
  statefulSet,
  controllerRevision,
  // Error
  unknown;

  const ResourceKind();

  /// Returns a [ResourceKind] from a given string or [ResourceKind.unknown].
  factory ResourceKind.fromString(String kind) {
    return ResourceKind.values.firstWhere(
      (e) => e.name == kind,
      orElse: () => ResourceKind.unknown,
    );
  }
}
