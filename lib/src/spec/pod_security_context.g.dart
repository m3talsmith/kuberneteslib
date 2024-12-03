// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_security_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodSecurityContext _$PodSecurityContextFromJson(Map<String, dynamic> json) =>
    PodSecurityContext()
      ..fsGroup = (json['fsGroup'] as num?)?.toInt()
      ..fsGroupChangePolicy = json['fsGroupChangePolicy'] as String?
      ..runAsGroup = (json['runAsGroup'] as num?)?.toInt()
      ..runAsNonRoot = json['runAsNonRoot'] as bool?
      ..runAsUser = (json['runAsUser'] as num?)?.toInt()
      ..seLinuxOptions = json['seLinuxOptions'] == null
          ? null
          : SELinuxOptions.fromJson(
              json['seLinuxOptions'] as Map<String, dynamic>)
      ..seccompProfile = json['seccompProfile'] == null
          ? null
          : SeccompProfile.fromJson(
              json['seccompProfile'] as Map<String, dynamic>)
      ..supplementalGroups = (json['supplementalGroups'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
      ..sysctls = (json['sysctls'] as List<dynamic>?)
          ?.map((e) => Sysctl.fromJson(e as Map<String, dynamic>))
          .toList()
      ..windowsOptions = json['windowsOptions'] == null
          ? null
          : WindowsSecurityContextOptions.fromJson(
              json['windowsOptions'] as Map<String, dynamic>);

Map<String, dynamic> _$PodSecurityContextToJson(PodSecurityContext instance) =>
    <String, dynamic>{
      if (instance.fsGroup case final value?) 'fsGroup': value,
      if (instance.fsGroupChangePolicy case final value?)
        'fsGroupChangePolicy': value,
      if (instance.runAsGroup case final value?) 'runAsGroup': value,
      if (instance.runAsNonRoot case final value?) 'runAsNonRoot': value,
      if (instance.runAsUser case final value?) 'runAsUser': value,
      if (instance.seLinuxOptions case final value?) 'seLinuxOptions': value,
      if (instance.seccompProfile case final value?) 'seccompProfile': value,
      if (instance.supplementalGroups case final value?)
        'supplementalGroups': value,
      if (instance.sysctls case final value?) 'sysctls': value,
      if (instance.windowsOptions case final value?) 'windowsOptions': value,
    };
