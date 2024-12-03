// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecurityContext _$SecurityContextFromJson(Map<String, dynamic> json) =>
    SecurityContext()
      ..allowPrivilegeEscalation = json['allowPrivilegeEscalation'] as bool?
      ..capabilities = json['capabilities'] == null
          ? null
          : Capabilities.fromJson(json['capabilities'] as Map<String, dynamic>)
      ..privileged = json['privileged'] as bool?
      ..procMount = json['procMount'] as String?
      ..readOnlyRootFilesystem = json['readOnlyRootFilesystem'] as bool?
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
      ..windowsOptions = json['windowsOptions'] == null
          ? null
          : WindowsSecurityContextOptions.fromJson(
              json['windowsOptions'] as Map<String, dynamic>);

Map<String, dynamic> _$SecurityContextToJson(SecurityContext instance) =>
    <String, dynamic>{
      if (instance.allowPrivilegeEscalation case final value?)
        'allowPrivilegeEscalation': value,
      if (instance.capabilities case final value?) 'capabilities': value,
      if (instance.privileged case final value?) 'privileged': value,
      if (instance.procMount case final value?) 'procMount': value,
      if (instance.readOnlyRootFilesystem case final value?)
        'readOnlyRootFilesystem': value,
      if (instance.runAsGroup case final value?) 'runAsGroup': value,
      if (instance.runAsNonRoot case final value?) 'runAsNonRoot': value,
      if (instance.runAsUser case final value?) 'runAsUser': value,
      if (instance.seLinuxOptions case final value?) 'seLinuxOptions': value,
      if (instance.seccompProfile case final value?) 'seccompProfile': value,
      if (instance.windowsOptions case final value?) 'windowsOptions': value,
    };
