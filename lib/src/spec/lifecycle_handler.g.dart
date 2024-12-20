// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifecycle_handler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LifecycleHandler _$LifecycleHandlerFromJson(Map<String, dynamic> json) =>
    LifecycleHandler()
      ..exec = _execFromJson(json['exec'] as Map<String, dynamic>?)
      ..httpGet = _httpGetFromJson(json['httpGet'] as Map<String, dynamic>?)
      ..tcpSocket =
          _tcpSocketFromJson(json['tcpSocket'] as Map<String, dynamic>?);

Map<String, dynamic> _$LifecycleHandlerToJson(LifecycleHandler instance) =>
    <String, dynamic>{
      if (_execToJson(instance.exec) case final value?) 'exec': value,
      if (_httpGetToJson(instance.httpGet) case final value?) 'httpGet': value,
      if (_tcpSocketToJson(instance.tcpSocket) case final value?)
        'tcpSocket': value,
    };
