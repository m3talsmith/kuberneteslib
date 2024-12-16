import 'package:json_annotation/json_annotation.dart';

import '../../kuberneteslib.dart';

class FieldV1Converter
    implements JsonConverter<FieldsV1, Map<String, dynamic>> {
  const FieldV1Converter();

  @override
  FieldsV1 fromJson(Map<String, dynamic> json) => FieldsV1.fromJson(json);

  @override
  Map<String, dynamic> toJson(FieldsV1 object) => object.toJson();
}
