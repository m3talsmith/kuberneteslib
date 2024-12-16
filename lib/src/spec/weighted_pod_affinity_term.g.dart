// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weighted_pod_affinity_term.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeightedPodAffinityTerm _$WeightedPodAffinityTermFromJson(
        Map<String, dynamic> json) =>
    WeightedPodAffinityTerm(
      podAffinityTerm: _podAffinityTermFromJson(
          json['podAffinityTerm'] as Map<String, dynamic>?),
      weight: (json['weight'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WeightedPodAffinityTermToJson(
        WeightedPodAffinityTerm instance) =>
    <String, dynamic>{
      if (_podAffinityTermToJson(instance.podAffinityTerm) case final value?)
        'podAffinityTerm': value,
      'weight': instance.weight,
    };
