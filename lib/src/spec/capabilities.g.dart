// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Capabilities _$CapabilitiesFromJson(Map<String, dynamic> json) => Capabilities()
  ..add = (json['add'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..drop = (json['drop'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$CapabilitiesToJson(Capabilities instance) =>
    <String, dynamic>{
      if (instance.add case final value?) 'add': value,
      if (instance.drop case final value?) 'drop': value,
    };
