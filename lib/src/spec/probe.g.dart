// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'probe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Probe _$ProbeFromJson(Map<String, dynamic> json) => Probe()
  ..exec = _execActionFromJson(json['exec'] as Map<String, dynamic>?)
  ..failureThreshold = (json['failureThreshold'] as num?)?.toInt()
  ..grpc = _grpcActionFromJson(json['grpc'] as Map<String, dynamic>?)
  ..httpGet = _httpGetActionFromJson(json['httpGet'] as Map<String, dynamic>?)
  ..initialDelaySeconds = (json['initialDelaySeconds'] as num?)?.toInt()
  ..periodSeconds = (json['periodSeconds'] as num?)?.toInt()
  ..successThreshold = (json['successThreshold'] as num?)?.toInt()
  ..tcpSocket =
      _tcpSocketActionFromJson(json['tcpSocket'] as Map<String, dynamic>?)
  ..terminationGracePeriodSeconds =
      (json['terminationGracePeriodSeconds'] as num?)?.toInt()
  ..timeoutSeconds = (json['timeoutSeconds'] as num?)?.toInt();

Map<String, dynamic> _$ProbeToJson(Probe instance) => <String, dynamic>{
      if (_execActionToJson(instance.exec) case final value?) 'exec': value,
      if (instance.failureThreshold case final value?)
        'failureThreshold': value,
      if (_grpcActionToJson(instance.grpc) case final value?) 'grpc': value,
      if (_httpGetActionToJson(instance.httpGet) case final value?)
        'httpGet': value,
      if (instance.initialDelaySeconds case final value?)
        'initialDelaySeconds': value,
      if (instance.periodSeconds case final value?) 'periodSeconds': value,
      if (instance.successThreshold case final value?)
        'successThreshold': value,
      if (_tcpSocketActionToJson(instance.tcpSocket) case final value?)
        'tcpSocket': value,
      if (instance.terminationGracePeriodSeconds case final value?)
        'terminationGracePeriodSeconds': value,
      if (instance.timeoutSeconds case final value?) 'timeoutSeconds': value,
    };
