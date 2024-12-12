// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_field_selector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceFieldSelector _$ResourceFieldSelectorFromJson(
        Map<String, dynamic> json) =>
    ResourceFieldSelector(
      containerName: json['containerName'] as String?,
      divisor: json['divisor'],
      resource: json['resource'] as String?,
    );

Map<String, dynamic> _$ResourceFieldSelectorToJson(
        ResourceFieldSelector instance) =>
    <String, dynamic>{
      if (instance.containerName case final value?) 'containerName': value,
      if (instance.divisor case final value?) 'divisor': value,
      if (instance.resource case final value?) 'resource': value,
    };
