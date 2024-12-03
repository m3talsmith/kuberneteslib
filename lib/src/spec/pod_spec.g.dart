// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_spec.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodSpec _$PodSpecFromJson(Map<String, dynamic> json) => PodSpec(
      containers: (json['containers'] as List<dynamic>?)
          ?.map((e) => Container.fromJson(e as Map<String, dynamic>))
          .toList(),
      activeDeadlineSeconds: (json['activeDeadlineSeconds'] as num?)?.toInt(),
      affinity: _$JsonConverterFromJson<String, Affinity>(
          json['affinity'], const AffinityConverter().fromJson),
      automountServiceAccountToken:
          json['automountServiceAccountToken'] as bool?,
      dnsConfig: json['dnsConfig'] == null
          ? null
          : PodDNSConfig.fromJson(json['dnsConfig'] as Map<String, dynamic>),
      dnsPolicy: json['dnsPolicy'] as String?,
      enableServiceLinks: json['enableServiceLinks'] as bool?,
      ephemeralContainers: (json['ephemeralContainers'] as List<dynamic>?)
          ?.map((e) => EphemeralContainer.fromJson(e as Map<String, dynamic>))
          .toList(),
      hostAliases: (json['hostAliases'] as List<dynamic>?)
          ?.map((e) => HostAlias.fromJson(e as Map<String, dynamic>))
          .toList(),
      hostIPC: json['hostIPC'] as bool?,
      hostNetwork: json['hostNetwork'] as bool?,
      hostUsers: json['hostUsers'] as bool?,
      hostname: json['hostname'] as String?,
      imagePullSecrets: (json['imagePullSecrets'] as List<dynamic>?)
          ?.map((e) => LocalObjectReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      initContainers: (json['initContainers'] as List<dynamic>?)
          ?.map((e) => Container.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodeName: json['nodeName'] as String?,
      nodeSelector: json['nodeSelector'] as Map<String, dynamic>?,
      os: json['os'] == null
          ? null
          : PodOS.fromJson(json['os'] as Map<String, dynamic>),
      overhead: json['overhead'] as Map<String, dynamic>?,
      preemptionPolicy: json['preemptionPolicy'] as String?,
      priority: (json['priority'] as num?)?.toInt(),
      priorityClassName: json['priorityClassName'] as String?,
      readinessGates: (json['readinessGates'] as List<dynamic>?)
          ?.map((e) => PodReadinessGate.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceClaims: (json['resourceClaims'] as List<dynamic>?)
          ?.map((e) => PodResourceClaim.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourcePolicy: json['resourcePolicy'] as String?,
      runtimeClassName: json['runtimeClassName'] as String?,
      schedulerName: json['schedulerName'] as String?,
      schedulingGates: (json['schedulingGates'] as List<dynamic>?)
          ?.map((e) => PodSchedulingGate.fromJson(e as Map<String, dynamic>))
          .toList(),
      securityContext: json['securityContext'] == null
          ? null
          : PodSecurityContext.fromJson(
              json['securityContext'] as Map<String, dynamic>),
      serviceAccount: json['serviceAccount'] as String?,
      serviceAccountName: json['serviceAccountName'] as String?,
      setHostnameAsFQDN: json['setHostnameAsFQDN'] as bool?,
      shareProcessNamespace: json['shareProcessNamespace'] as bool?,
      subdomain: json['subdomain'] as String?,
      terminationGracePeriodSeconds:
          (json['terminationGracePeriodSeconds'] as num?)?.toInt(),
      tolerations: (json['tolerations'] as List<dynamic>?)
          ?.map((e) => Toleration.fromJson(e as Map<String, dynamic>))
          .toList(),
      topologySpreadConstraints:
          (json['topologySpreadConstraints'] as List<dynamic>?)
              ?.map((e) =>
                  TopologySpreadConstraint.fromJson(e as Map<String, dynamic>))
              .toList(),
      volumes: (json['volumes'] as List<dynamic>?)
          ?.map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PodSpecToJson(PodSpec instance) => <String, dynamic>{
      if (instance.activeDeadlineSeconds case final value?)
        'activeDeadlineSeconds': value,
      if (_$JsonConverterToJson<String, Affinity>(
              instance.affinity, const AffinityConverter().toJson)
          case final value?)
        'affinity': value,
      if (instance.automountServiceAccountToken case final value?)
        'automountServiceAccountToken': value,
      if (instance.containers case final value?) 'containers': value,
      if (instance.dnsConfig case final value?) 'dnsConfig': value,
      if (instance.dnsPolicy case final value?) 'dnsPolicy': value,
      if (instance.enableServiceLinks case final value?)
        'enableServiceLinks': value,
      if (instance.ephemeralContainers case final value?)
        'ephemeralContainers': value,
      if (instance.hostAliases case final value?) 'hostAliases': value,
      if (instance.hostIPC case final value?) 'hostIPC': value,
      if (instance.hostNetwork case final value?) 'hostNetwork': value,
      if (instance.hostUsers case final value?) 'hostUsers': value,
      if (instance.hostname case final value?) 'hostname': value,
      if (instance.imagePullSecrets case final value?)
        'imagePullSecrets': value,
      if (instance.initContainers case final value?) 'initContainers': value,
      if (instance.nodeName case final value?) 'nodeName': value,
      if (instance.nodeSelector case final value?) 'nodeSelector': value,
      if (instance.os case final value?) 'os': value,
      if (instance.overhead case final value?) 'overhead': value,
      if (instance.preemptionPolicy case final value?)
        'preemptionPolicy': value,
      if (instance.priority case final value?) 'priority': value,
      if (instance.priorityClassName case final value?)
        'priorityClassName': value,
      if (instance.readinessGates case final value?) 'readinessGates': value,
      if (instance.resourceClaims case final value?) 'resourceClaims': value,
      if (instance.resourcePolicy case final value?) 'resourcePolicy': value,
      if (instance.runtimeClassName case final value?)
        'runtimeClassName': value,
      if (instance.schedulerName case final value?) 'schedulerName': value,
      if (instance.schedulingGates case final value?) 'schedulingGates': value,
      if (instance.securityContext case final value?) 'securityContext': value,
      if (instance.serviceAccount case final value?) 'serviceAccount': value,
      if (instance.serviceAccountName case final value?)
        'serviceAccountName': value,
      if (instance.setHostnameAsFQDN case final value?)
        'setHostnameAsFQDN': value,
      if (instance.shareProcessNamespace case final value?)
        'shareProcessNamespace': value,
      if (instance.subdomain case final value?) 'subdomain': value,
      if (instance.terminationGracePeriodSeconds case final value?)
        'terminationGracePeriodSeconds': value,
      if (instance.tolerations case final value?) 'tolerations': value,
      if (instance.topologySpreadConstraints case final value?)
        'topologySpreadConstraints': value,
      if (instance.volumes case final value?) 'volumes': value,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
