// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_selector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeSelector _$NodeSelectorFromJson(Map<String, dynamic> json) => NodeSelector()
  ..nodeSelectorTerms = (json['nodeSelectorTerms'] as List<dynamic>)
      .map((e) => NodeSelectorTerm.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$NodeSelectorToJson(NodeSelector instance) =>
    <String, dynamic>{
      'nodeSelectorTerms': instance.nodeSelectorTerms,
    };
