// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topology_spread_constraint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopologySpreadConstraint _$TopologySpreadConstraintFromJson(
        Map<String, dynamic> json) =>
    TopologySpreadConstraint()
      ..labelSelector =
          _labelSelectorFromJson(json['labelSelector'] as Map<String, dynamic>?)
      ..matchLabelKeys = (json['matchLabelKeys'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..maxSkew = (json['maxSkew'] as num?)?.toInt()
      ..minDomains = (json['minDomains'] as num?)?.toInt()
      ..nodeAffinityPolicy = json['nodeAffinityPolicy'] as String?
      ..nodeTaintsPolicy = json['nodeTaintsPolicy'] as String?
      ..topologyKey = json['topologyKey'] as String?
      ..whenUnsatisfiable = json['whenUnsatisfiable'] as String?;

Map<String, dynamic> _$TopologySpreadConstraintToJson(
        TopologySpreadConstraint instance) =>
    <String, dynamic>{
      if (_labelSelectorToJson(instance.labelSelector) case final value?)
        'labelSelector': value,
      if (instance.matchLabelKeys case final value?) 'matchLabelKeys': value,
      if (instance.maxSkew case final value?) 'maxSkew': value,
      if (instance.minDomains case final value?) 'minDomains': value,
      if (instance.nodeAffinityPolicy case final value?)
        'nodeAffinityPolicy': value,
      if (instance.nodeTaintsPolicy case final value?)
        'nodeTaintsPolicy': value,
      if (instance.topologyKey case final value?) 'topologyKey': value,
      if (instance.whenUnsatisfiable case final value?)
        'whenUnsatisfiable': value,
    };
