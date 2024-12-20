// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'label_selector_requirement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabelSelectorRequirement _$LabelSelectorRequirementFromJson(
        Map<String, dynamic> json) =>
    LabelSelectorRequirement(
      key: json['key'] as String?,
      operator: json['operator'] as String?,
      values: _valuesFromJson(json['values'] as List?),
    );

Map<String, dynamic> _$LabelSelectorRequirementToJson(
        LabelSelectorRequirement instance) =>
    <String, dynamic>{
      if (instance.key case final value?) 'key': value,
      if (instance.operator case final value?) 'operator': value,
      if (_valuesToJson(instance.values) case final value?) 'values': value,
    };
