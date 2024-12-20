// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_spec.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodSpec _$PodSpecFromJson(Map<String, dynamic> json) => PodSpec(
      containers: _containersFromJson(json['containers'] as List?),
      activeDeadlineSeconds: (json['activeDeadlineSeconds'] as num?)?.toInt(),
      affinity: _$JsonConverterFromJson<Map<String, dynamic>, Affinity>(
          json['affinity'], const AffinityConverter().fromJson),
      automountServiceAccountToken:
          json['automountServiceAccountToken'] as bool?,
      dnsConfig: _$JsonConverterFromJson<Map<String, dynamic>, PodDNSConfig>(
          json['dnsConfig'], const PodDNSConfigConverter().fromJson),
      dnsPolicy: json['dnsPolicy'] as String?,
      enableServiceLinks: json['enableServiceLinks'] as bool?,
      ephemeralContainers:
          _ephemeralContainersFromJson(json['ephemeralContainers'] as List?),
      hostAliases: _hostAliasesFromJson(json['hostAliases'] as List?),
      hostIPC: json['hostIPC'] as bool?,
      hostNetwork: json['hostNetwork'] as bool?,
      hostUsers: json['hostUsers'] as bool?,
      hostname: json['hostname'] as String?,
      imagePullSecrets: _$JsonConverterFromJson<List<Map<String, dynamic>>,
              List<LocalObjectReference>>(json['imagePullSecrets'],
          const LocalObjectReferencesConverter().fromJson),
      initContainers:
          _$JsonConverterFromJson<List<Map<String, dynamic>>, List<Container>>(
              json['initContainers'], const ContainersConverter().fromJson),
      nodeName: json['nodeName'] as String?,
      nodeSelector: json['nodeSelector'] as Map<String, dynamic>?,
      os: _podOSFromJson(json['os'] as Map<String, dynamic>?),
      overhead: json['overhead'] as Map<String, dynamic>?,
      preemptionPolicy: json['preemptionPolicy'] as String?,
      priority: (json['priority'] as num?)?.toInt(),
      priorityClassName: json['priorityClassName'] as String?,
      readinessGates:
          _podReadinessGatesFromJson(json['readinessGates'] as List?),
      resourceClaims:
          _podResourceClaimsFromJson(json['resourceClaims'] as List?),
      resourcePolicy: json['resourcePolicy'] as String?,
      runtimeClassName: json['runtimeClassName'] as String?,
      schedulerName: json['schedulerName'] as String?,
      schedulingGates:
          _podSchedulingGatesFromJson(json['schedulingGates'] as List?),
      securityContext:
          _$JsonConverterFromJson<Map<String, dynamic>, PodSecurityContext>(
              json['securityContext'],
              const PodSecurityContextConverter().fromJson),
      serviceAccount: json['serviceAccount'] as String?,
      serviceAccountName: json['serviceAccountName'] as String?,
      setHostnameAsFQDN: json['setHostnameAsFQDN'] as bool?,
      shareProcessNamespace: json['shareProcessNamespace'] as bool?,
      subdomain: json['subdomain'] as String?,
      terminationGracePeriodSeconds:
          (json['terminationGracePeriodSeconds'] as num?)?.toInt(),
      tolerations: _tolerationsFromJson(json['tolerations'] as List?),
      topologySpreadConstraints: _topologySpreadConstraintsFromJson(
          json['topologySpreadConstraints'] as List?),
      volumes: _volumesFromJson(json['volumes'] as List?),
      kind: json['kind'] as String? ?? 'pod',
    );

Map<String, dynamic> _$PodSpecToJson(PodSpec instance) => <String, dynamic>{
      if (instance.kind case final value?) 'kind': value,
      if (instance.activeDeadlineSeconds case final value?)
        'activeDeadlineSeconds': value,
      if (_$JsonConverterToJson<Map<String, dynamic>, Affinity>(
              instance.affinity, const AffinityConverter().toJson)
          case final value?)
        'affinity': value,
      if (instance.automountServiceAccountToken case final value?)
        'automountServiceAccountToken': value,
      if (_containersToJson(instance.containers) case final value?)
        'containers': value,
      if (_$JsonConverterToJson<Map<String, dynamic>, PodDNSConfig>(
              instance.dnsConfig, const PodDNSConfigConverter().toJson)
          case final value?)
        'dnsConfig': value,
      if (instance.dnsPolicy case final value?) 'dnsPolicy': value,
      if (instance.enableServiceLinks case final value?)
        'enableServiceLinks': value,
      if (_ephemeralContainersToJson(instance.ephemeralContainers)
          case final value?)
        'ephemeralContainers': value,
      if (_hostAliasesToJson(instance.hostAliases) case final value?)
        'hostAliases': value,
      if (instance.hostIPC case final value?) 'hostIPC': value,
      if (instance.hostNetwork case final value?) 'hostNetwork': value,
      if (instance.hostUsers case final value?) 'hostUsers': value,
      if (instance.hostname case final value?) 'hostname': value,
      if (_$JsonConverterToJson<List<Map<String, dynamic>>,
                  List<LocalObjectReference>>(instance.imagePullSecrets,
              const LocalObjectReferencesConverter().toJson)
          case final value?)
        'imagePullSecrets': value,
      if (_$JsonConverterToJson<List<Map<String, dynamic>>, List<Container>>(
              instance.initContainers, const ContainersConverter().toJson)
          case final value?)
        'initContainers': value,
      if (instance.nodeName case final value?) 'nodeName': value,
      if (instance.nodeSelector case final value?) 'nodeSelector': value,
      if (_podOSToJson(instance.os) case final value?) 'os': value,
      if (instance.overhead case final value?) 'overhead': value,
      if (instance.preemptionPolicy case final value?)
        'preemptionPolicy': value,
      if (instance.priority case final value?) 'priority': value,
      if (instance.priorityClassName case final value?)
        'priorityClassName': value,
      if (_podReadinessGatesToJson(instance.readinessGates) case final value?)
        'readinessGates': value,
      if (_podResourceClaimsToJson(instance.resourceClaims) case final value?)
        'resourceClaims': value,
      if (instance.resourcePolicy case final value?) 'resourcePolicy': value,
      if (instance.runtimeClassName case final value?)
        'runtimeClassName': value,
      if (instance.schedulerName case final value?) 'schedulerName': value,
      if (_podSchedulingGatesToJson(instance.schedulingGates) case final value?)
        'schedulingGates': value,
      if (_$JsonConverterToJson<Map<String, dynamic>, PodSecurityContext>(
              instance.securityContext,
              const PodSecurityContextConverter().toJson)
          case final value?)
        'securityContext': value,
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
      if (_tolerationsToJson(instance.tolerations) case final value?)
        'tolerations': value,
      if (_topologySpreadConstraintsToJson(instance.topologySpreadConstraints)
          case final value?)
        'topologySpreadConstraints': value,
      if (_volumesToJson(instance.volumes) case final value?) 'volumes': value,
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
