// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_resource_claim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodResourceClaim _$PodResourceClaimFromJson(Map<String, dynamic> json) =>
    PodResourceClaim()
      ..name = json['name'] as String
      ..source = ClaimSource.fromJson(json['source'] as Map<String, dynamic>);

Map<String, dynamic> _$PodResourceClaimToJson(PodResourceClaim instance) =>
    <String, dynamic>{
      'name': instance.name,
      'source': instance.source,
    };
