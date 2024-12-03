// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifecycle_handler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LifecycleHandler _$LifecycleHandlerFromJson(Map<String, dynamic> json) =>
    LifecycleHandler()
      ..exec = json['exec'] == null
          ? null
          : ExecAction.fromJson(json['exec'] as Map<String, dynamic>)
      ..httpGet = json['httpGet'] == null
          ? null
          : HTTPGetAction.fromJson(json['httpGet'] as Map<String, dynamic>)
      ..tcpSocket = json['tcpSocket'] == null
          ? null
          : TCPSocketAction.fromJson(json['tcpSocket'] as Map<String, dynamic>);

Map<String, dynamic> _$LifecycleHandlerToJson(LifecycleHandler instance) =>
    <String, dynamic>{
      if (instance.exec case final value?) 'exec': value,
      if (instance.httpGet case final value?) 'httpGet': value,
      if (instance.tcpSocket case final value?) 'tcpSocket': value,
    };
