// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_affinity_term.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodAffinityTerm _$PodAffinityTermFromJson(Map<String, dynamic> json) =>
    PodAffinityTerm(
      labelSelector: _labelSelectorFromJson(
          json['labelSelector'] as Map<String, dynamic>?),
      namespaceSelector: _labelSelectorFromJson(
          json['namespaceSelector'] as Map<String, dynamic>?),
      namespaces: _namespacesFromJson(json['namespaces'] as List?),
      topologyKey: json['topologyKey'] as String?,
    );

Map<String, dynamic> _$PodAffinityTermToJson(PodAffinityTerm instance) =>
    <String, dynamic>{
      if (_labelSelectorToJson(instance.labelSelector) case final value?)
        'labelSelector': value,
      if (_labelSelectorToJson(instance.namespaceSelector) case final value?)
        'namespaceSelector': value,
      if (_namespacesToJson(instance.namespaces) case final value?)
        'namespaces': value,
      if (instance.topologyKey case final value?) 'topologyKey': value,
    };
