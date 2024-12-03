// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container_resize_policy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContainerResizePolicy _$ContainerResizePolicyFromJson(
        Map<String, dynamic> json) =>
    ContainerResizePolicy()
      ..resourceName = json['resourceName'] as String
      ..restartPolicy = json['restartPolicy'] as String;

Map<String, dynamic> _$ContainerResizePolicyToJson(
        ContainerResizePolicy instance) =>
    <String, dynamic>{
      'resourceName': instance.resourceName,
      'restartPolicy': instance.restartPolicy,
    };
