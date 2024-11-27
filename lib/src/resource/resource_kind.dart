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

  factory ResourceKind.fromString(String kind) {
    return ResourceKind.values.firstWhere(
      (e) => e.name == kind,
      orElse: () => ResourceKind.unknown,
    );
  }
}
