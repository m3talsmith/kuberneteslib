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
      values:
          (json['values'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$LabelSelectorRequirementToJson(
        LabelSelectorRequirement instance) =>
    <String, dynamic>{
      if (instance.key case final value?) 'key': value,
      if (instance.operator case final value?) 'operator': value,
      if (instance.values case final value?) 'values': value,
    };
