// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'windows_security_context_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindowsSecurityContextOptions _$WindowsSecurityContextOptionsFromJson(
        Map<String, dynamic> json) =>
    WindowsSecurityContextOptions(
      gmsaCredentialSpec: json['gmsaCredentialSpec'] as String?,
      gmsaCredentialSpecName: json['gmsaCredentialSpecName'] as String?,
      hostProcess: json['hostProcess'] as bool?,
      runAsUserName: json['runAsUserName'] as String?,
    );

Map<String, dynamic> _$WindowsSecurityContextOptionsToJson(
        WindowsSecurityContextOptions instance) =>
    <String, dynamic>{
      if (instance.gmsaCredentialSpec case final value?)
        'gmsaCredentialSpec': value,
      if (instance.gmsaCredentialSpecName case final value?)
        'gmsaCredentialSpecName': value,
      if (instance.hostProcess case final value?) 'hostProcess': value,
      if (instance.runAsUserName case final value?) 'runAsUserName': value,
    };
