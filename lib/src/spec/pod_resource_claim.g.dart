// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_resource_claim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodResourceClaim _$PodResourceClaimFromJson(Map<String, dynamic> json) =>
    PodResourceClaim()
      ..name = json['name'] as String?
      ..source = _sourceFromJson(json['source'] as Map<String, dynamic>?);

Map<String, dynamic> _$PodResourceClaimToJson(PodResourceClaim instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (_sourceToJson(instance.source) case final value?) 'source': value,
    };
