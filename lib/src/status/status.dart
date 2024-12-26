import '../resource/resource_kind.dart';

import 'container.dart';
import 'pod.dart';
import 'replication_controller.dart';
import 'endpoints.dart';
import 'volume.dart';
import 'binding.dart';
import 'persistent_volume.dart';
import 'daemon_set.dart';
import 'deployment.dart';
import 'replica_set.dart';
import 'stateful_set.dart';
import 'controller_revision.dart';
import 'cron_job.dart';
import 'job.dart';
import 'pod_set.dart';
import 'node_set.dart';
import 'namespace_set.dart';
import 'secret_set.dart';
import 'config_map_set.dart';
import 'service_set.dart';
import 'endpoint_set.dart';
import 'service.dart';
import 'config_map.dart';
import 'secret.dart';
import 'persistent_volume_claim.dart';
import 'volume_set.dart';
import 'event_set.dart';
import 'custom_resource_definition.dart';
import 'limit_range.dart';
import 'mutating_webhook_configuration.dart';
import 'validating_webhook_configuration.dart';
import 'pod_template.dart';
import 'pod_disruption_budget.dart';
import 'component_status.dart';
import 'namespace.dart';
import 'node.dart';
import 'resource_quota.dart';
import 'service_account.dart';
import 'event.dart';
import 'event_series.dart';

class Status {
  const Status();

  factory Status.fromJson(Map<String, dynamic> json) {
    switch (ResourceKind.fromString(json['kind'])) {
      case ResourceKind.container:
        return ContainerStatus.fromJson(json);

      case ResourceKind.pod:
        return PodStatus.fromJson(json);

      case ResourceKind.replicationController:
        return ReplicationControllerStatus.fromJson(json);

      case ResourceKind.endpoints:
        return EndpointsStatus.fromJson(json);

      case ResourceKind.volume:
        return VolumeStatus.fromJson(json);

      case ResourceKind.binding:
        return BindingStatus.fromJson(json);

      case ResourceKind.persistentVolume:
        return PersistentVolumeStatus.fromJson(json);

      case ResourceKind.daemonSet:
        return DaemonSetStatus.fromJson(json);

      case ResourceKind.deployment:
        return DeploymentStatus.fromJson(json);

      case ResourceKind.replicaSet:
        return ReplicaSetStatus.fromJson(json);

      case ResourceKind.statefulSet:
        return StatefulSetStatus.fromJson(json);

      case ResourceKind.controllerRevision:
        return ControllerRevisionStatus.fromJson(json);

      case ResourceKind.cronJob:
        return CronJobStatus.fromJson(json);

      case ResourceKind.job:
        return JobStatus.fromJson(json);

      case ResourceKind.podSet:
        return PodSetStatus.fromJson(json);

      case ResourceKind.nodeSet:
        return NodeSetStatus.fromJson(json);

      case ResourceKind.namespaceSet:
        return NamespaceSetStatus.fromJson(json);

      case ResourceKind.secretSet:
        return SecretSetStatus.fromJson(json);

      case ResourceKind.configMapSet:
        return ConfigMapSetStatus.fromJson(json);

      case ResourceKind.serviceSet:
        return ServiceSetStatus.fromJson(json);

      case ResourceKind.endpointSet:
        return EndpointSetStatus.fromJson(json);

      case ResourceKind.service:
        return ServiceStatus.fromJson(json);

      case ResourceKind.configMap:
        return ConfigMapStatus.fromJson(json);

      case ResourceKind.secret:
        return SecretStatus.fromJson(json);

      case ResourceKind.persistentVolumeClaim:
        return PersistentVolumeClaimStatus.fromJson(json);

      case ResourceKind.volumeSet:
        return VolumeSetStatus.fromJson(json);

      case ResourceKind.eventSet:
        return EventSetStatus.fromJson(json);

      case ResourceKind.customResourceDefinition:
        return CustomResourceDefinitionStatus.fromJson(json);

      case ResourceKind.limitRange:
        return LimitRangeStatus.fromJson(json);

      case ResourceKind.mutatingWebhookConfiguration:
        return MutatingWebhookConfigurationStatus.fromJson(json);

      case ResourceKind.validatingWebhookConfiguration:
        return ValidatingWebhookConfigurationStatus.fromJson(json);

      case ResourceKind.podTemplate:
        return PodTemplateStatus.fromJson(json);

      case ResourceKind.podDisruptionBudget:
        return PodDisruptionBudgetStatus.fromJson(json);

      case ResourceKind.componentStatus:
        return ComponentStatusStatus.fromJson(json);

      case ResourceKind.namespace:
        return NamespaceStatus.fromJson(json);

      case ResourceKind.node:
        return NodeStatus.fromJson(json);

      case ResourceKind.resourceQuota:
        return ResourceQuotaStatus.fromJson(json);

      case ResourceKind.serviceAccount:
        return ServiceAccountStatus.fromJson(json);

      case ResourceKind.event:
        return EventStatus.fromJson(json);

      case ResourceKind.eventSeries:
        return EventSeriesStatus.fromJson(json);

      default:
        throw UnimplementedError('Unknown status kind: ${json['kind']}');
    }
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
