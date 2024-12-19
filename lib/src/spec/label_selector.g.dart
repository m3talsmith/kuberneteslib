// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'label_selector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabelSelector _$LabelSelectorFromJson(Map<String, dynamic> json) =>
    LabelSelector(
      matchExpressions:
          _matchExpressionsFromJson(json['matchExpressions'] as List?),
      matchLabels:
          _matchLabelsFromJson(json['matchLabels'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$LabelSelectorToJson(LabelSelector instance) =>
    <String, dynamic>{
      if (_matchExpressionsToJson(instance.matchExpressions) case final value?)
        'matchExpressions': value,
      if (_matchLabelsToJson(instance.matchLabels) case final value?)
        'matchLabels': value,
    };
