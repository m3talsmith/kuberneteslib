// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tcp_socket_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TCPSocketAction _$TCPSocketActionFromJson(Map<String, dynamic> json) =>
    TCPSocketAction(
      host: json['host'] as String?,
      port: json['port'],
    );

Map<String, dynamic> _$TCPSocketActionToJson(TCPSocketAction instance) =>
    <String, dynamic>{
      if (instance.host case final value?) 'host': value,
      if (instance.port case final value?) 'port': value,
    };
