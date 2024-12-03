// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aws_elastic_block_store_volume_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AWSElasticBlockStoreVolumeSource _$AWSElasticBlockStoreVolumeSourceFromJson(
        Map<String, dynamic> json) =>
    AWSElasticBlockStoreVolumeSource()
      ..fsType = json['fsType'] as String
      ..partition = (json['partition'] as num).toInt()
      ..readOnly = json['readOnly'] as bool
      ..volumeID = json['volumeID'] as String;

Map<String, dynamic> _$AWSElasticBlockStoreVolumeSourceToJson(
        AWSElasticBlockStoreVolumeSource instance) =>
    <String, dynamic>{
      'fsType': instance.fsType,
      'partition': instance.partition,
      'readOnly': instance.readOnly,
      'volumeID': instance.volumeID,
    };
