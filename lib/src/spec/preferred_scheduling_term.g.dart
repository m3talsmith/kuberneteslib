// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferred_scheduling_term.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreferredSchedulingTerm _$PreferredSchedulingTermFromJson(
        Map<String, dynamic> json) =>
    PreferredSchedulingTerm()
      ..preference =
          NodeSelectorTerm.fromJson(json['preference'] as Map<String, dynamic>)
      ..weight = (json['weight'] as num).toInt();

Map<String, dynamic> _$PreferredSchedulingTermToJson(
        PreferredSchedulingTerm instance) =>
    <String, dynamic>{
      'preference': instance.preference,
      'weight': instance.weight,
    };
