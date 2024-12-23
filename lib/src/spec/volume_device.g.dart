// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumeDevice _$VolumeDeviceFromJson(Map<String, dynamic> json) => VolumeDevice(
      devicePath: json['devicePath'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$VolumeDeviceToJson(VolumeDevice instance) =>
    <String, dynamic>{
      if (instance.devicePath case final value?) 'devicePath': value,
      if (instance.name case final value?) 'name': value,
    };
