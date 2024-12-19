// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_get_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HTTPGetAction _$HTTPGetActionFromJson(Map<String, dynamic> json) =>
    HTTPGetAction(
      host: json['host'] as String?,
      httpHeaders: _httpHeadersFromJson(json['httpHeaders'] as List?),
      path: json['path'] as String?,
      port: json['port'],
      scheme: json['scheme'] as String?,
    );

Map<String, dynamic> _$HTTPGetActionToJson(HTTPGetAction instance) =>
    <String, dynamic>{
      if (instance.host case final value?) 'host': value,
      if (_httpHeadersToJson(instance.httpHeaders) case final value?)
        'httpHeaders': value,
      if (instance.path case final value?) 'path': value,
      if (instance.port case final value?) 'port': value,
      if (instance.scheme case final value?) 'scheme': value,
    };
