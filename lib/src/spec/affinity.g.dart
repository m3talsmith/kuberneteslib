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
  ..affinity = _affinityFromJson(json['affinity'] as Map<String, dynamic>?);

Map<String, dynamic> _$NodeAffinityToJson(NodeAffinity instance) =>
    <String, dynamic>{
      if (_preferredSchedulingTermToJson(
              instance.preferredDuringSchedulingIgnoredDuringExecution)
          case final value?)
        'preferredDuringSchedulingIgnoredDuringExecution': value,
      if (_nodeSelectorToJson(
              instance.requiredDuringSchedulingIgnoredDuringExecution)
          case final value?)
        'requiredDuringSchedulingIgnoredDuringExecution': value,
      'kind': _affinityKindToJson(instance.kind),
      if (_affinityToJson(instance.affinity) case final value?)
        'affinity': value,
    };

const _$AffinityKindEnumMap = {
  AffinityKind.nodeAffinity: 'nodeAffinity',
  AffinityKind.podAffinity: 'podAffinity',
  AffinityKind.podAntiAffinity: 'podAntiAffinity',
  AffinityKind.unknown: 'unknown',
};

PodAffinity _$PodAffinityFromJson(Map<String, dynamic> json) => PodAffinity()
  ..preferredDuringSchedulingIgnoredDuringExecution =
      _weightedPodAffinityTermFromJson(
          json['preferredDuringSchedulingIgnoredDuringExecution'] as List?)
  ..requiredDuringSchedulingIgnoredDuringExecution = _podAffinityTermFromJson(
      json['requiredDuringSchedulingIgnoredDuringExecution'] as List?)
  ..kind = $enumDecodeNullable(_$AffinityKindEnumMap, json['kind'])
  ..affinity = json['affinity'] == null
      ? null
      : Affinity.fromJson(json['affinity'] as Map<String, dynamic>);

Map<String, dynamic> _$PodAffinityToJson(PodAffinity instance) =>
    <String, dynamic>{
      if (_weightedPodAffinityTermToJson(
              instance.preferredDuringSchedulingIgnoredDuringExecution)
          case final value?)
        'preferredDuringSchedulingIgnoredDuringExecution': value,
      if (_podAffinityTermToJson(
              instance.requiredDuringSchedulingIgnoredDuringExecution)
          case final value?)
        'requiredDuringSchedulingIgnoredDuringExecution': value,
      'kind': _$AffinityKindEnumMap[instance.kind],
      'affinity': instance.affinity,
    };

PodAntiAffinity _$PodAntiAffinityFromJson(Map<String, dynamic> json) =>
    PodAntiAffinity(
      preferredDuringSchedulingIgnoredDuringExecution:
          _weightedPodAffinityTermFromJson(
              json['preferredDuringSchedulingIgnoredDuringExecution'] as List?),
      requiredDuringSchedulingIgnoredDuringExecution: _podAffinityTermFromJson(
          json['requiredDuringSchedulingIgnoredDuringExecution'] as List?),
    )
      ..kind = $enumDecodeNullable(_$AffinityKindEnumMap, json['kind'])
      ..affinity = json['affinity'] == null
          ? null
          : Affinity.fromJson(json['affinity'] as Map<String, dynamic>);

Map<String, dynamic> _$PodAntiAffinityToJson(PodAntiAffinity instance) =>
    <String, dynamic>{
      if (_weightedPodAffinityTermToJson(
              instance.preferredDuringSchedulingIgnoredDuringExecution)
          case final value?)
        'preferredDuringSchedulingIgnoredDuringExecution': value,
      if (_podAffinityTermToJson(
              instance.requiredDuringSchedulingIgnoredDuringExecution)
          case final value?)
        'requiredDuringSchedulingIgnoredDuringExecution': value,
      'kind': _$AffinityKindEnumMap[instance.kind],
      'affinity': instance.affinity,
    };
