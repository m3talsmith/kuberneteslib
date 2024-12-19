// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_requirements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceRequirements _$ResourceRequirementsFromJson(
        Map<String, dynamic> json) =>
    ResourceRequirements(
      claims: _claimsFromJson(json['claims'] as List?),
      limits: json['limits'] as Map<String, dynamic>?,
      requests: json['requests'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ResourceRequirementsToJson(
        ResourceRequirements instance) =>
    <String, dynamic>{
      if (_claimsToJson(instance.claims) case final value?) 'claims': value,
      if (instance.limits case final value?) 'limits': value,
      if (instance.requests case final value?) 'requests': value,
    };
