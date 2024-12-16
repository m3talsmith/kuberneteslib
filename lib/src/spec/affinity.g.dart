// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affinity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeAffinity _$NodeAffinityFromJson(Map<String, dynamic> json) => NodeAffinity()
  ..preferredDuringSchedulingIgnoredDuringExecution =
      _preferredSchedulingTermFromJson(
          json['preferredDuringSchedulingIgnoredDuringExecution'] as List?)
  ..requiredDuringSchedulingIgnoredDuringExecution = _nodeSelectorFromJson(
      json['requiredDuringSchedulingIgnoredDuringExecution']
          as Map<String, dynamic>?)
  ..kind = $enumDecodeNullable(_$AffinityKindEnumMap, json['kind'])
  ..affinity = json['affinity'] == null
      ? null
      : Affinity.fromJson(json['affinity'] as Map<String, dynamic>);

Map<String, dynamic> _$NodeAffinityToJson(NodeAffinity instance) =>
    <String, dynamic>{
      'preferredDuringSchedulingIgnoredDuringExecution':
          _preferredSchedulingTermToJson(
              instance.preferredDuringSchedulingIgnoredDuringExecution),
      if (_nodeSelectorToJson(
              instance.requiredDuringSchedulingIgnoredDuringExecution)
          case final value?)
        'requiredDuringSchedulingIgnoredDuringExecution': value,
      'kind': _$AffinityKindEnumMap[instance.kind],
      'affinity': instance.affinity,
    };

const _$AffinityKindEnumMap = {
  AffinityKind.nodeAffinity: 'nodeAffinity',
  AffinityKind.podAffinity: 'podAffinity',
  AffinityKind.podAntiAffinity: 'podAntiAffinity',
  AffinityKind.unknown: 'unknown',
};

PodAffinity _$PodAffinityFromJson(Map<String, dynamic> json) => PodAffinity()
  ..preferredDuringSchedulingIgnoredDuringExecution = (json[
          'preferredDuringSchedulingIgnoredDuringExecution'] as List<dynamic>?)
      ?.map((e) => WeightedPodAffinityTerm.fromJson(e as Map<String, dynamic>))
      .toList()
  ..requiredDuringSchedulingIgnoredDuringExecution =
      (json['requiredDuringSchedulingIgnoredDuringExecution'] as List<dynamic>?)
          ?.map((e) => PodAffinityTerm.fromJson(e as Map<String, dynamic>))
          .toList()
  ..kind = $enumDecodeNullable(_$AffinityKindEnumMap, json['kind'])
  ..affinity = json['affinity'] == null
      ? null
      : Affinity.fromJson(json['affinity'] as Map<String, dynamic>);

Map<String, dynamic> _$PodAffinityToJson(PodAffinity instance) =>
    <String, dynamic>{
      'preferredDuringSchedulingIgnoredDuringExecution':
          instance.preferredDuringSchedulingIgnoredDuringExecution,
      'requiredDuringSchedulingIgnoredDuringExecution':
          instance.requiredDuringSchedulingIgnoredDuringExecution,
      'kind': _$AffinityKindEnumMap[instance.kind],
      'affinity': instance.affinity,
    };

PodAntiAffinity _$PodAntiAffinityFromJson(Map<String, dynamic> json) =>
    PodAntiAffinity(
      preferredDuringSchedulingIgnoredDuringExecution:
          (json['preferredDuringSchedulingIgnoredDuringExecution']
                  as List<dynamic>?)
              ?.map((e) =>
                  WeightedPodAffinityTerm.fromJson(e as Map<String, dynamic>))
              .toList(),
      requiredDuringSchedulingIgnoredDuringExecution:
          (json['requiredDuringSchedulingIgnoredDuringExecution']
                  as List<dynamic>?)
              ?.map((e) => PodAffinityTerm.fromJson(e as Map<String, dynamic>))
              .toList(),
    )
      ..kind = $enumDecodeNullable(_$AffinityKindEnumMap, json['kind'])
      ..affinity = json['affinity'] == null
          ? null
          : Affinity.fromJson(json['affinity'] as Map<String, dynamic>);

Map<String, dynamic> _$PodAntiAffinityToJson(PodAntiAffinity instance) =>
    <String, dynamic>{
      'preferredDuringSchedulingIgnoredDuringExecution':
          instance.preferredDuringSchedulingIgnoredDuringExecution,
      'requiredDuringSchedulingIgnoredDuringExecution':
          instance.requiredDuringSchedulingIgnoredDuringExecution,
      'kind': _$AffinityKindEnumMap[instance.kind],
      'affinity': instance.affinity,
    };
