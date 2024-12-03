// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downward_api_projection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownwardAPIProjection _$DownwardAPIProjectionFromJson(
        Map<String, dynamic> json) =>
    DownwardAPIProjection()
      ..items = (json['items'] as List<dynamic>?)
          ?.map(
              (e) => DownwardAPIVolumeFile.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DownwardAPIProjectionToJson(
        DownwardAPIProjection instance) =>
    <String, dynamic>{
      if (instance.items case final value?) 'items': value,
    };
