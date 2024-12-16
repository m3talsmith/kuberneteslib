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
      values: _valuesFromJson(json['values'] as List?),
    );

Map<String, dynamic> _$NodeSelectorRequirementToJson(
        NodeSelectorRequirement instance) =>
    <String, dynamic>{
      if (instance.key case final value?) 'key': value,
      if (instance.operator case final value?) 'operator': value,
      if (_valuesToJson(instance.values) case final value?) 'values': value,
    };
