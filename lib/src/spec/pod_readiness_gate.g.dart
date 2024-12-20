// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_readiness_gate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodReadinessGate _$PodReadinessGateFromJson(Map<String, dynamic> json) =>
    PodReadinessGate(
      conditionType: json['conditionType'] as String?,
    );

Map<String, dynamic> _$PodReadinessGateToJson(PodReadinessGate instance) =>
    <String, dynamic>{
      if (instance.conditionType case final value?) 'conditionType': value,
    };
