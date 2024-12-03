// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifecycle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lifecycle _$LifecycleFromJson(Map<String, dynamic> json) => Lifecycle()
  ..postStart = json['postStart'] == null
      ? null
      : LifecycleHandler.fromJson(json['postStart'] as Map<String, dynamic>)
  ..preStop = json['preStop'] == null
      ? null
      : LifecycleHandler.fromJson(json['preStop'] as Map<String, dynamic>);

Map<String, dynamic> _$LifecycleToJson(Lifecycle instance) => <String, dynamic>{
      if (instance.postStart case final value?) 'postStart': value,
      if (instance.preStop case final value?) 'preStop': value,
    };
