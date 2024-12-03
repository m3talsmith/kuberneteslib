// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_requirements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceRequirements _$ResourceRequirementsFromJson(
        Map<String, dynamic> json) =>
    ResourceRequirements()
      ..claims = (json['claims'] as List<dynamic>?)
          ?.map((e) => ResourceClaim.fromJson(e as Map<String, dynamic>))
          .toList()
      ..limits = json['limits'] as Map<String, dynamic>?
      ..requests = json['requests'] as Map<String, dynamic>?;

Map<String, dynamic> _$ResourceRequirementsToJson(
        ResourceRequirements instance) =>
    <String, dynamic>{
      if (instance.claims case final value?) 'claims': value,
      if (instance.limits case final value?) 'limits': value,
      if (instance.requests case final value?) 'requests': value,
    };
