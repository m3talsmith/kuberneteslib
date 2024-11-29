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
import 'spec.dart';
import 'toleration.dart';
import 'topology_spread_constraint.dart';
import 'volume.dart';

/// Represents the specification of a Kubernetes Pod.
/// 
/// A Pod is the smallest deployable unit in Kubernetes that can be created and managed.
/// This class defines all possible configuration options for a Pod's specification,
/// including its containers, volumes, scheduling rules, and runtime behavior.
class PodSpec extends Spec {
  /// Maximum time in seconds for a pod to complete its execution.
  /// After this deadline, the pod may be terminated.
  int? activeDeadlineSeconds;

  /// Scheduling directives that control pod placement based on node characteristics
  /// and relationships with other pods.
  Affinity? affinity;

  /// Whether to automatically mount the service account token.
  /// If null, defaults to true.
  bool? automountServiceAccountToken;

  /// The list of containers that will run in this pod.
  /// At least one container is required.
  List<Container>? containers;

  /// Custom DNS settings for the pod.
  /// Allows fine-grained control over DNS resolution.
  PodDNSConfig? dnsConfig;

  /// DNS resolution policy for the pod.
  /// Common values: "Default", "ClusterFirst", "None"
  String? dnsPolicy;

  /// Whether to inject information about services into pod's environment variables.
  /// If null, defaults to true.
  bool? enableServiceLinks;

  /// Temporary containers that may be added to an existing pod for user-initiated activities.
  /// Commonly used for debugging purposes.
  List<EphemeralContainer>? ephemeralContainers;

  /// Additional entries to add to the pod's /etc/hosts file.
  List<HostAlias>? hostAliases;

  /// Use the host's IPC namespace.
  /// Controls whether containers within the pod can communicate via IPC.
  bool? hostIPC;

  /// Use the host's network namespace.
  /// If true, containers see the network interfaces of the host.
  bool? hostNetwork;

  /// Use the host's user namespace.
  /// Controls whether containers run with host OS user contexts.
  bool? hostUsers;

  /// The hostname of the pod.
  /// If not specified, defaults to pod's name.
  String? hostname;

  /// References to secrets used for pulling container images.
  List<LocalObjectReference>? imagePullSecrets;

  /// Containers that run to completion before the main containers start.
  /// Used for setup or initialization tasks.
  List<Container>? initContainers;

  /// Request to schedule this pod onto a specific node.
  String? nodeName;

  /// Key-value pairs used for node selection.
  /// Pod will only run on nodes matching these criteria.
  Map<String, dynamic>? nodeSelector;

  /// Operating system configuration for the pod.
  PodOS? os;

  /// Resources consumed by the pod infrastructure, not directly by its containers.
  Map<String, dynamic>? overhead;

  /// Defines whether this pod can be preempted by other pods.
  String? preemptionPolicy;

  /// The priority value for this pod.
  /// Higher values indicate higher priority.
  int? priority;

  /// Reference to a PriorityClass object that defines the pod's priority.
  String? priorityClassName;

  /// Additional conditions that must be met for pod readiness.
  List<PodReadinessGate>? readinessGates;

  /// Claims for resources that the pod requires.
  List<PodResourceClaim>? resourceClaims;

  /// Resource management policy for the pod.
  String? resourcePolicy;

  /// The runtime class to use for this pod.
  /// Defines the container runtime configuration.
  String? runtimeClassName;

  /// Name of the scheduler to use for pod scheduling.
  /// Defaults to default scheduler if not specified.
  String? schedulerName;

  /// Gates that must be satisfied before the pod can be scheduled.
  List<PodSchedulingGate>? schedulingGates;

  /// Security context settings that apply to the entire pod.
  PodSecurityContext? securityContext;

  /// @deprecated Use serviceAccountName instead.
  /// The service account to use for this pod.
  String? serviceAccount;

  /// Name of the service account to use for this pod.
  String? serviceAccountName;

  /// Whether the pod's hostname will be configured as the pod's FQDN.
  bool? setHostnameAsFQDN;

  /// Enable sharing of process namespace between containers in the pod.
  bool? shareProcessNamespace;

  /// Subdomain for the pod, used in conjunction with hostname.
  String? subdomain;

  /// Duration in seconds the pod needs to terminate gracefully.
  int? terminationGracePeriodSeconds;

  /// Pod scheduling rules that allow it to tolerate specific node taints.
  List<Toleration>? tolerations;

  /// Rules for how pods ought to spread across topology domains.
  List<TopologySpreadConstraint>? topologySpreadConstraints;

  /// List of volumes that can be mounted by containers in the pod.
  List<Volume>? volumes;

  /// Creates a new PodSpec instance from a Map representation.
  /// 
  /// [data] should be a Map containing the pod specification fields as defined
  /// in the Kubernetes API. This constructor handles the deserialization of
  /// all nested objects and lists.
  PodSpec.fromMap(Map<String, dynamic> data) {
    activeDeadlineSeconds = data['activeDeadlineSeconds'];
    if (data['affinity'] != null) affinity = Affinity.fromMap(data['affinity']);
    automountServiceAccountToken = data['automountServiceAccountToken'];
    if (data['containers'] != null) {
      containers = [];
      for (var e in data['containers']) {
        containers!.add(Container.fromMap(e));
      }
    }
    if (data['dnsConfig'] != null) {
      dnsConfig = PodDNSConfig.fromMap(data['dnsConfig']);
    }
    dnsPolicy = data['dnsPolicy'];
    enableServiceLinks = data['enableServiceLinks'];
    if (data['ephemeralContainers'] != null) {
      ephemeralContainers = [];
      for (var e in data['ephemeralContainers']) {
        ephemeralContainers!.add(EphemeralContainer.fromMap(e));
      }
    }
    if (data['hostAliases'] != null) {
      hostAliases = [];
      for (var e in data['hostAliases']) {
        hostAliases!.add(HostAlias.fromMap(e));
      }
    }
    hostIPC = data['hostIPC'];
    hostNetwork = data['hostNetwork'];
    hostUsers = data['hostUsers'];
    hostname = data['hostname'];
    if (data['imagePullSecrets'] != null) {
      imagePullSecrets = [];
      for (var e in data['imagePullSecrets']) {
        imagePullSecrets!.add(LocalObjectReference.fromMap(e));
      }
    }
    if (data['initContainers'] != null) {
      initContainers = [];
      for (var e in data['initContainers']) {
        initContainers!.add(Container.fromMap(e));
      }
    }
    nodeName = data['nodeName'];
    if (data['nodeSelector'] != null) {
      nodeSelector = {};
      for (var e in (data['nodeSelector'] as Map<String, dynamic>).entries) {
        nodeSelector![e.key] = e.value;
      }
    }
    if (data['os'] != null) {
      os = PodOS.fromMap(data['os']);
    }
    if (data['overhead'] != null) {
      overhead = {};
      for (var e in (data['overhead'] as Map<String, dynamic>).entries) {
        overhead![e.key] = e.value;
      }
    }
    preemptionPolicy = data['preemptionPolicy'];
    priority = data['priority'];
    priorityClassName = data['priorityClassName'];
    if (data['readinessGates'] != null) {
      readinessGates = [];
      for (var e in data['readinessGates']) {
        readinessGates!.add(PodReadinessGate.fromMap(e));
      }
    }
    if (data['resourceClaims'] != null) {
      resourceClaims = [];
      for (var e in data['resourceClaims']) {
        resourceClaims!.add(PodResourceClaim.fromMap(e));
      }
    }
    resourcePolicy = data['resourcePolicy'];
    runtimeClassName = data['runtimeClassName'];
    schedulerName = data['schedulerName'];
    if (data['schedulingGates'] != null) {
      schedulingGates = [];
      for (var e in data['schedulingGates']) {
        schedulingGates!.add(PodSchedulingGate.fromMap(e));
      }
    }
    if (data['securityContext'] != null) {
      securityContext = PodSecurityContext.fromMap(data['securityContext']);
    }
    serviceAccount = data['serviceAccount'];
    serviceAccountName = data['serviceAccountName'];
    setHostnameAsFQDN = data['setHostnameAsFQDN'];
    shareProcessNamespace = data['shareProcessNamespace'];
    subdomain = data['subdomain'];
    terminationGracePeriodSeconds = data['terminationGracePeriodSeconds'];
    if (data['tolerations'] != null) {
      tolerations = [];
      for (var e in data['tolerations']) {
        tolerations!.add(Toleration.fromMap(e));
      }
    }
    if (data['topologySpreadConstraints'] != null) {
      topologySpreadConstraints = [];
      for (var e in data['topologySpreadConstraints']) {
        topologySpreadConstraints!.add(TopologySpreadConstraint.fromMap(e));
      }
    }
    if (data['volumes'] != null) {
      volumes = [];
      for (var e in data['volumes']) {
        volumes!.add(Volume.fromMap(e));
      }
    }
  }

  /// Converts this PodSpec instance to a Map representation.
  /// 
  /// Returns a Map containing all non-null properties of the PodSpec.
  /// This is useful for serialization and API communication.
  Map<String, dynamic> toMap() {
    final newMap = <String, dynamic>{};

    if (activeDeadlineSeconds != null) {
      newMap['activeDeadlineSeconds'] = activeDeadlineSeconds;
    }
    if (affinity != null) {
      newMap['affinity'] = affinity!.toMap();
    }
    if (automountServiceAccountToken != null) {
      newMap['automountServiceAccountToken'] = automountServiceAccountToken;
    }
    if (containers != null) {
      newMap['containers'] = containers!.map((e) => e.toMap()).toList();
    }
    if (dnsConfig != null) {
      newMap['dnsConfig'] = dnsConfig!.toMap();
    }
    if (dnsPolicy != null) {
      newMap['dnsPolicy'] = dnsPolicy;
    }
    if (enableServiceLinks != null) {
      newMap['enableServiceLinks'] = enableServiceLinks;
    }
    if (ephemeralContainers != null) {
      newMap['ephemeralContainers'] = ephemeralContainers!.map((e) => e.toMap()).toList();
    }
    if (hostAliases != null) {
      newMap['hostAliases'] = hostAliases!.map((e) => e.toMap()).toList();
    }
    if (hostIPC != null) {
      newMap['hostIPC'] = hostIPC;
    }
    if (hostNetwork != null) {
      newMap['hostNetwork'] = hostNetwork;
    }
    if (hostPID != null) {
      newMap['hostPID'] = hostPID;
    }
    if (hostname != null) {
      newMap['hostname'] = hostname;
    }
    if (imagePullSecrets != null) {
      newMap['imagePullSecrets'] = imagePullSecrets!.map((e) => e.toMap()).toList();
    }
    if (initContainers != null) {
      newMap['initContainers'] = initContainers!.map((e) => e.toMap()).toList();
    }
    if (nodeName != null) {
      newMap['nodeName'] = nodeName;
    }
    if (nodeSelector != null) {
      newMap['nodeSelector'] = nodeSelector;
    }
    if (os != null) {
      newMap['os'] = os!.toMap();
    }
    if (overhead != null) {
      newMap['overhead'] = overhead;
    }
    if (preemptionPolicy != null) {
      newMap['preemptionPolicy'] = preemptionPolicy;
    }
    if (priority != null) {
      newMap['priority'] = priority;
    }
    if (priorityClassName != null) {
      newMap['priorityClassName'] = priorityClassName;
    }
    if (readinessGates != null) {
      newMap['readinessGates'] = readinessGates!.map((e) => e.toMap()).toList();
    }
    if (resourceClaims != null) {
      newMap['resourceClaims'] = resourceClaims!.map((e) => e.toMap()).toList();
    }
    if (resourcePolicy != null) {
      newMap['resourcePolicy'] = resourcePolicy;
    }
    if (runtimeClassName != null) {
      newMap['runtimeClassName'] = runtimeClassName;
    }
    if (schedulerName != null) {
      newMap['schedulerName'] = schedulerName;
    }
    if (schedulingGates != null) {
      newMap['schedulingGates'] = schedulingGates!.map((e) => e.toMap()).toList();
    }
    if (securityContext != null) {
      newMap['securityContext'] = securityContext!.toMap();
    }
    if (serviceAccount != null) {
      newMap['serviceAccount'] = serviceAccount;
    }
    if (serviceAccountName != null) {
      newMap['serviceAccountName'] = serviceAccountName;
    }
    if (setHostnameAsFQDN != null) {
      newMap['setHostnameAsFQDN'] = setHostnameAsFQDN;
    }
    if (shareProcessNamespace != null) {
      newMap['shareProcessNamespace'] = shareProcessNamespace;
    }
    if (subdomain != null) {
      newMap['subdomain'] = subdomain;
    }
    if (terminationGracePeriodSeconds != null) {
      newMap['terminationGracePeriodSeconds'] = terminationGracePeriodSeconds;
    }
    if (tolerations != null) {
      newMap['tolerations'] = tolerations!.map((e) => e.toMap()).toList();
    }
    if (topologySpreadConstraints != null) {
      newMap['topologySpreadConstraints'] = topologySpreadConstraints!.map((e) => e.toMap()).toList();
    }
    if (volumes != null) {
      newMap['volumes'] = volumes!.map((e) => e.toMap()).toList();
    }

    return newMap;
  }
}
