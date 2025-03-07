import 'package:json_annotation/json_annotation.dart';

import '../helpers/containers_converter.dart';
import '../helpers/local_object_references_converter.dart';
import '../helpers/pod_dns_config_converter.dart';
import '../helpers/pod_security_context_converter.dart';
import 'affinity.dart';
import 'container.dart';
import 'ephemeral_container.dart';
import 'host_alias.dart';
import 'local_object_reference.dart';
import 'pod_dns_config.dart';
import 'pod_os.dart';
import 'pod_readiness_gate.dart';
import 'pod_resource_claim.dart';
import 'pod_scheduling_gate.dart';
import 'pod_security_context.dart';
import 'toleration.dart';
import 'topology_spread_constraint.dart';
import 'volume.dart';
import 'object_spec.dart';

part 'pod_spec.g.dart';

/// Represents the specification of a Kubernetes Pod.
///
/// PodSpec defines the desired state of a Pod, which is the smallest deployable
/// unit in Kubernetes. Key features include:
/// - Container configuration
/// - Resource requirements
/// - Scheduling preferences
/// - Security settings
/// - Network configuration
/// - Storage configuration
///
/// Common use cases:
/// - Application deployment
/// - Batch processing
/// - Stateful workloads
/// - System services
///
/// Example:
/// ```dart
/// final podSpec = PodSpec(spec: {})
///   ..containers = [
///     Container()
///       ..name = 'web'
///       ..image = 'nginx:1.14.2'
///       ..ports = [
///         ContainerPort()..containerPort = 80
///       ]
///   ]
///   ..securityContext = (PodSecurityContext()
///     ..runAsNonRoot = true)
///   ..dnsConfig = (PodDNSConfig()
///     ..nameservers = ['8.8.8.8']);
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#PodSpec)
/// for more details about Pod specifications.
@JsonSerializable()
class PodSpec implements ObjectSpec {
  PodSpec({
    this.containers,
    this.activeDeadlineSeconds,
    this.affinity,
    this.automountServiceAccountToken,
    this.dnsConfig,
    this.dnsPolicy,
    this.enableServiceLinks,
    this.ephemeralContainers,
    this.hostAliases,
    this.hostIPC,
    this.hostNetwork,
    this.hostUsers,
    this.hostname,
    this.imagePullSecrets,
    this.initContainers,
    this.nodeName,
    this.nodeSelector,
    this.os,
    this.overhead,
    this.preemptionPolicy,
    this.priority,
    this.priorityClassName,
    this.readinessGates,
    this.resourceClaims,
    this.resourcePolicy,
    this.runtimeClassName,
    this.schedulerName,
    this.schedulingGates,
    this.securityContext,
    this.serviceAccount,
    this.serviceAccountName,
    this.setHostnameAsFQDN,
    this.shareProcessNamespace,
    this.subdomain,
    this.terminationGracePeriodSeconds,
    this.tolerations,
    this.topologySpreadConstraints,
    this.volumes,
    this.kind = 'pod',
  });

  @JsonKey(includeIfNull: false)
  String? kind;

  /// Maximum time in seconds for a pod to complete its execution.
  /// After this deadline, the pod may be terminated.
  @JsonKey(includeIfNull: false)
  int? activeDeadlineSeconds;

  /// Scheduling directives that control pod placement based on node characteristics
  /// and relationships with other pods.
  @JsonKey(includeIfNull: false)
  @AffinityConverter()
  Affinity? affinity;

  /// Whether to automatically mount the service account token.
  /// If null, defaults to true.
  @JsonKey(includeIfNull: false)
  bool? automountServiceAccountToken;

  /// The list of containers that will run in this pod.
  /// At least one container is required.
  @JsonKey(
      includeIfNull: false,
      fromJson: _containersFromJson,
      toJson: _containersToJson)
  // @ContainersConverter()
  List<SpecContainer>? containers;

  /// Custom DNS settings for the pod.
  /// Allows fine-grained control over DNS resolution.
  @JsonKey(includeIfNull: false)
  @PodDNSConfigConverter()
  PodDNSConfig? dnsConfig;

  /// DNS resolution policy for the pod.
  /// Common values: "Default", "ClusterFirst", "None"
  @JsonKey(includeIfNull: false)
  String? dnsPolicy;

  /// Whether to inject information about services into pod's environment variables.
  /// If null, defaults to true.
  @JsonKey(includeIfNull: false)
  bool? enableServiceLinks;

  /// Temporary containers that may be added to an existing pod for user-initiated activities.
  /// Commonly used for debugging purposes.
  @JsonKey(
      includeIfNull: false,
      fromJson: _ephemeralContainersFromJson,
      toJson: _ephemeralContainersToJson)
  List<EphemeralContainer>? ephemeralContainers;

  /// Additional entries to add to the pod's /etc/hosts file.
  @JsonKey(
      includeIfNull: false,
      fromJson: _hostAliasesFromJson,
      toJson: _hostAliasesToJson)
  List<HostAlias>? hostAliases;

  /// Use the host's IPC namespace.
  /// Controls whether containers within the pod can communicate via IPC.
  @JsonKey(includeIfNull: false)
  bool? hostIPC;

  /// Use the host's network namespace.
  /// If true, containers see the network interfaces of the host.
  @JsonKey(includeIfNull: false)
  bool? hostNetwork;

  /// Use the host's user namespace.
  /// Controls whether containers run with host OS user contexts.
  @JsonKey(includeIfNull: false)
  bool? hostUsers;

  /// The hostname of the pod.
  /// If not specified, defaults to pod's name.
  @JsonKey(includeIfNull: false)
  String? hostname;

  /// References to secrets used for pulling container images.
  @JsonKey(includeIfNull: false)
  @LocalObjectReferencesConverter()
  List<LocalObjectReference>? imagePullSecrets;

  /// Containers that run to completion before the main containers start.
  /// Used for setup or initialization tasks.
  @JsonKey(includeIfNull: false)
  @ContainersConverter()
  List<SpecContainer>? initContainers;

  /// Request to schedule this pod onto a specific node.
  @JsonKey(includeIfNull: false)
  String? nodeName;

  /// Key-value pairs used for node selection.
  /// Pod will only run on nodes matching these criteria.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? nodeSelector;

  /// Operating system configuration for the pod.
  @JsonKey(includeIfNull: false, fromJson: _podOSFromJson, toJson: _podOSToJson)
  PodOS? os;

  /// Resources consumed by the pod infrastructure, not directly by its containers.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? overhead;

  /// Defines whether this pod can be preempted by other pods.
  @JsonKey(includeIfNull: false)
  String? preemptionPolicy;

  /// The priority value for this pod.
  /// Higher values indicate higher priority.
  @JsonKey(includeIfNull: false)
  int? priority;

  /// Reference to a PriorityClass object that defines the pod's priority.
  @JsonKey(includeIfNull: false)
  String? priorityClassName;

  /// Additional conditions that must be met for pod readiness.
  @JsonKey(
      includeIfNull: false,
      fromJson: _podReadinessGatesFromJson,
      toJson: _podReadinessGatesToJson)
  List<PodReadinessGate>? readinessGates;

  /// Claims for resources that the pod requires.
  @JsonKey(
      includeIfNull: false,
      fromJson: _podResourceClaimsFromJson,
      toJson: _podResourceClaimsToJson)
  List<PodResourceClaim>? resourceClaims;

  /// Resource management policy for the pod.
  @JsonKey(includeIfNull: false)
  String? resourcePolicy;

  /// The runtime class to use for this pod.
  /// Defines the container runtime configuration.
  @JsonKey(includeIfNull: false)
  String? runtimeClassName;

  /// Name of the scheduler to use for pod scheduling.
  /// Defaults to default scheduler if not specified.
  @JsonKey(includeIfNull: false)
  String? schedulerName;

  /// Gates that must be satisfied before the pod can be scheduled.
  @JsonKey(
      includeIfNull: false,
      fromJson: _podSchedulingGatesFromJson,
      toJson: _podSchedulingGatesToJson)
  List<PodSchedulingGate>? schedulingGates;

  /// Security context settings that apply to the entire pod.
  @JsonKey(includeIfNull: false)
  @PodSecurityContextConverter()
  PodSecurityContext? securityContext;

  /// @deprecated Use serviceAccountName instead.
  /// The service account to use for this pod.
  @JsonKey(includeIfNull: false)
  String? serviceAccount;

  /// Name of the service account to use for this pod.
  @JsonKey(includeIfNull: false)
  String? serviceAccountName;

  /// Whether the pod's hostname will be configured as the pod's FQDN.
  @JsonKey(includeIfNull: false)
  bool? setHostnameAsFQDN;

  /// Enable sharing of process namespace between containers in the pod.
  @JsonKey(includeIfNull: false)
  bool? shareProcessNamespace;

  /// Subdomain for the pod, used in conjunction with hostname.
  @JsonKey(includeIfNull: false)
  String? subdomain;

  /// Duration in seconds the pod needs to terminate gracefully.
  @JsonKey(includeIfNull: false)
  int? terminationGracePeriodSeconds;

  /// Pod scheduling rules that allow it to tolerate specific node taints.
  @JsonKey(
      includeIfNull: false,
      fromJson: _tolerationsFromJson,
      toJson: _tolerationsToJson)
  List<Toleration>? tolerations;

  /// Rules for how pods ought to spread across topology domains.
  @JsonKey(
      includeIfNull: false,
      fromJson: _topologySpreadConstraintsFromJson,
      toJson: _topologySpreadConstraintsToJson)
  List<TopologySpreadConstraint>? topologySpreadConstraints;

  /// List of volumes that can be mounted by containers in the pod.
  @JsonKey(
      includeIfNull: false, fromJson: _volumesFromJson, toJson: _volumesToJson)
  List<Volume>? volumes;

  /// Creates a new PodSpec from a Map representation.
  ///
  /// [data] should be a Map containing the pod specification fields as defined
  /// in the Kubernetes API. This constructor handles the deserialization of
  /// all nested objects and lists.
  factory PodSpec.fromJson(Map<String, dynamic> data) =>
      _$PodSpecFromJson(data);

  @override
  Map<String, dynamic> toJson() => _$PodSpecToJson(this);
}

List<SpecContainer>? _containersFromJson(List<dynamic>? json) => json
    ?.map((e) => SpecContainer.fromJson(e as Map<String, dynamic>))
    .toList();

List<Map<String, dynamic>>? _containersToJson(
        List<SpecContainer>? containers) =>
    containers?.map((e) => e.toJson()).toList();

List<Volume>? _volumesFromJson(List<dynamic>? json) =>
    json?.map((e) => Volume.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>>? _volumesToJson(List<Volume>? volumes) =>
    volumes?.map((e) => e.toJson()).toList();

List<TopologySpreadConstraint>? _topologySpreadConstraintsFromJson(
        List<dynamic>? json) =>
    json
        ?.map(
            (e) => TopologySpreadConstraint.fromJson(e as Map<String, dynamic>))
        .toList();

List<Map<String, dynamic>>? _topologySpreadConstraintsToJson(
        List<TopologySpreadConstraint>? constraints) =>
    constraints?.map((e) => e.toJson()).toList();

List<EphemeralContainer>? _ephemeralContainersFromJson(List<dynamic>? json) =>
    json
        ?.map((e) => EphemeralContainer.fromJson(e as Map<String, dynamic>))
        .toList();

List<Map<String, dynamic>>? _ephemeralContainersToJson(
        List<EphemeralContainer>? containers) =>
    containers?.map((e) => e.toJson()).toList();

List<HostAlias>? _hostAliasesFromJson(List<dynamic>? json) =>
    json?.map((e) => HostAlias.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>>? _hostAliasesToJson(List<HostAlias>? aliases) =>
    aliases?.map((e) => e.toJson()).toList();

List<PodReadinessGate>? _podReadinessGatesFromJson(List<dynamic>? json) => json
    ?.map((e) => PodReadinessGate.fromJson(e as Map<String, dynamic>))
    .toList();

List<Map<String, dynamic>>? _podReadinessGatesToJson(
        List<PodReadinessGate>? gates) =>
    gates?.map((e) => e.toJson()).toList();

List<PodResourceClaim>? _podResourceClaimsFromJson(List<dynamic>? json) => json
    ?.map((e) => PodResourceClaim.fromJson(e as Map<String, dynamic>))
    .toList();

List<Map<String, dynamic>>? _podResourceClaimsToJson(
        List<PodResourceClaim>? claims) =>
    claims?.map((e) => e.toJson()).toList();

List<PodSchedulingGate>? _podSchedulingGatesFromJson(List<dynamic>? json) =>
    json
        ?.map((e) => PodSchedulingGate.fromJson(e as Map<String, dynamic>))
        .toList();

List<Map<String, dynamic>>? _podSchedulingGatesToJson(
        List<PodSchedulingGate>? gates) =>
    gates?.map((e) => e.toJson()).toList();

List<Toleration>? _tolerationsFromJson(List<dynamic>? json) =>
    json?.map((e) => Toleration.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>>? _tolerationsToJson(List<Toleration>? tolerations) =>
    tolerations?.map((e) => e.toJson()).toList();

PodOS? _podOSFromJson(Map<String, dynamic>? json) =>
    json == null ? null : PodOS.fromJson(json);

Map<String, dynamic>? _podOSToJson(PodOS? os) => os?.toJson();
