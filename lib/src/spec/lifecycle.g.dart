// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifecycle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lifecycle _$LifecycleFromJson(Map<String, dynamic> json) => Lifecycle()
  ..postStart = _postStartFromJson(json['postStart'] as Map<String, dynamic>?)
  ..preStop = _preStopFromJson(json['preStop'] as Map<String, dynamic>?);

Map<String, dynamic> _$LifecycleToJson(Lifecycle instance) => <String, dynamic>{
      if (_postStartToJson(instance.postStart) case final value?)
        'postStart': value,
      if (_preStopToJson(instance.preStop) case final value?) 'preStop': value,
    };
