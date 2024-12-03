// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topology_spread_constraint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopologySpreadConstraint _$TopologySpreadConstraintFromJson(
        Map<String, dynamic> json) =>
    TopologySpreadConstraint()
      ..labelSelector = json['labelSelector'] == null
          ? null
          : LabelSelector.fromJson(
              json['labelSelector'] as Map<String, dynamic>)
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
      'labelSelector': instance.labelSelector,
      'matchLabelKeys': instance.matchLabelKeys,
      'maxSkew': instance.maxSkew,
      'minDomains': instance.minDomains,
      'nodeAffinityPolicy': instance.nodeAffinityPolicy,
      'nodeTaintsPolicy': instance.nodeTaintsPolicy,
      'topologyKey': instance.topologyKey,
      'whenUnsatisfiable': instance.whenUnsatisfiable,
    };
