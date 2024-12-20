// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectMeta _$ObjectMetaFromJson(Map<String, dynamic> json) => ObjectMeta(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      annotations: json['annotations'] as Map<String, dynamic>?,
      labels: json['labels'] as Map<String, dynamic>?,
    )
      ..creationTimestamp =
          _creationTimestampFromJson(json['creationTimestamp'] as String?)
      ..deletionGracePeriodSeconds =
          (json['deletionGracePeriodSeconds'] as num?)?.toInt()
      ..deletionTimestamp =
          _deletionTimestampFromJson(json['deletionTimestamp'] as String?)
      ..finalizers = (json['finalizers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..generateName = json['generateName'] as String?
      ..generation = (json['generation'] as num?)?.toInt()
      ..managedFields = _managedFieldsFromJson(json['managedFields'] as List?)
      ..ownerReferences =
          _ownerReferencesFromJson(json['ownerReferences'] as List?)
      ..resourceVersion = json['resourceVersion'] as String?
      ..selfLink = json['selfLink'] as String?
      ..uid = json['uid'] as String?;

Map<String, dynamic> _$ObjectMetaToJson(ObjectMeta instance) =>
    <String, dynamic>{
      if (instance.annotations case final value?) 'annotations': value,
      if (_creationTimestampToJson(instance.creationTimestamp)
          case final value?)
        'creationTimestamp': value,
      if (instance.deletionGracePeriodSeconds case final value?)
        'deletionGracePeriodSeconds': value,
      if (_deletionTimestampToJson(instance.deletionTimestamp)
          case final value?)
        'deletionTimestamp': value,
      if (instance.finalizers case final value?) 'finalizers': value,
      if (instance.generateName case final value?) 'generateName': value,
      if (instance.generation case final value?) 'generation': value,
      if (instance.labels case final value?) 'labels': value,
      if (_managedFieldsToJson(instance.managedFields) case final value?)
        'managedFields': value,
      if (instance.name case final value?) 'name': value,
      if (instance.namespace case final value?) 'namespace': value,
      if (_ownerReferencesToJson(instance.ownerReferences) case final value?)
        'ownerReferences': value,
      if (instance.resourceVersion case final value?) 'resourceVersion': value,
      if (instance.selfLink case final value?) 'selfLink': value,
      if (instance.uid case final value?) 'uid': value,
    };
