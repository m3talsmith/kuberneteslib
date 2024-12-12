// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_selector_requirement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeSelectorRequirement _$NodeSelectorRequirementFromJson(
        Map<String, dynamic> json) =>
    NodeSelectorRequirement(
      key: json['key'] as String?,
      operator: json['operator'] as String?,
      values:
          (json['values'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NodeSelectorRequirementToJson(
        NodeSelectorRequirement instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator': instance.operator,
      'values': instance.values,
    };
