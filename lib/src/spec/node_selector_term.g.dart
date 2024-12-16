// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_selector_term.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeSelectorTerm _$NodeSelectorTermFromJson(Map<String, dynamic> json) =>
    NodeSelectorTerm(
      matchExpressions:
          _nodeSelectorRequirementFromJson(json['matchExpressions'] as List?),
      matchFields:
          _nodeSelectorRequirementFromJson(json['matchFields'] as List?),
    );

Map<String, dynamic> _$NodeSelectorTermToJson(NodeSelectorTerm instance) =>
    <String, dynamic>{
      if (_nodeSelectorRequirementToJson(instance.matchExpressions)
          case final value?)
        'matchExpressions': value,
      if (_nodeSelectorRequirementToJson(instance.matchFields)
          case final value?)
        'matchFields': value,
    };
