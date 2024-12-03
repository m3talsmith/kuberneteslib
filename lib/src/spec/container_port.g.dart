// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container_port.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContainerPort _$ContainerPortFromJson(Map<String, dynamic> json) =>
    ContainerPort()
      ..containerPort = (json['containerPort'] as num?)?.toInt()
      ..hostIP = json['hostIP'] as String?
      ..hostPort = (json['hostPort'] as num?)?.toInt()
      ..name = json['name'] as String?
      ..protocol = json['protocol'] as String?;

Map<String, dynamic> _$ContainerPortToJson(ContainerPort instance) =>
    <String, dynamic>{
      if (instance.containerPort case final value?) 'containerPort': value,
      if (instance.hostIP case final value?) 'hostIP': value,
      if (instance.hostPort case final value?) 'hostPort': value,
      if (instance.name case final value?) 'name': value,
      if (instance.protocol case final value?) 'protocol': value,
    };
