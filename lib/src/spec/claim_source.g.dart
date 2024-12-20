// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClaimSource _$ClaimSourceFromJson(Map<String, dynamic> json) => ClaimSource(
      resourceClaimName: json['resourceClaimName'] as String?,
      resourceClaimTemplate: json['resourceClaimTemplate'] as String?,
    );

Map<String, dynamic> _$ClaimSourceToJson(ClaimSource instance) =>
    <String, dynamic>{
      if (instance.resourceClaimName case final value?)
        'resourceClaimName': value,
      if (instance.resourceClaimTemplate case final value?)
        'resourceClaimTemplate': value,
    };
