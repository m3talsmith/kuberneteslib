// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_selector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeSelector _$NodeSelectorFromJson(Map<String, dynamic> json) => NodeSelector(
      nodeSelectorTerms:
          _nodeSelectorTermFromJson(json['nodeSelectorTerms'] as List?),
    );

Map<String, dynamic> _$NodeSelectorToJson(NodeSelector instance) =>
    <String, dynamic>{
      if (_nodeSelectorTermToJson(instance.nodeSelectorTerms) case final value?)
        'nodeSelectorTerms': value,
    };
