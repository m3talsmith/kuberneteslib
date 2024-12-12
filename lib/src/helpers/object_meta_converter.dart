import 'package:json_annotation/json_annotation.dart';

import '../../kuberneteslib.dart';

class ObjectMetaConverter
    implements JsonConverter<ObjectMeta, Map<String, dynamic>> {
  const ObjectMetaConverter();

  @override
  ObjectMeta fromJson(Map<String, dynamic> json) => ObjectMeta.fromJson(json);

  @override
  Map<String, dynamic> toJson(ObjectMeta meta) => meta.toJson();
}
