// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_selector_term.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeSelectorTerm _$NodeSelectorTermFromJson(Map<String, dynamic> json) =>
    NodeSelectorTerm()
      ..matchExpressions = (json['matchExpressions'] as List<dynamic>)
          .map((e) =>
              NodeSelectorRequirement.fromJson(e as Map<String, dynamic>))
          .toList()
      ..matchFields = (json['matchFields'] as List<dynamic>)
          .map((e) =>
              NodeSelectorRequirement.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$NodeSelectorTermToJson(NodeSelectorTerm instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchFields': instance.matchFields,
    };
