// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grpc_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GRPCAction _$GRPCActionFromJson(Map<String, dynamic> json) => GRPCAction()
  ..port = (json['port'] as num).toInt()
  ..service = json['service'] as String;

Map<String, dynamic> _$GRPCActionToJson(GRPCAction instance) =>
    <String, dynamic>{
      'port': instance.port,
      'service': instance.service,
    };
