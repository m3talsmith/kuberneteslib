import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'custom_resource_definition.g.dart';

@JsonSerializable()
class CustomResourceDefinitionStatus implements Status {
  const CustomResourceDefinitionStatus();

  @override
  factory CustomResourceDefinitionStatus.fromJson(Map<String, dynamic> json) =>
      _$CustomResourceDefinitionStatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CustomResourceDefinitionStatusToJson(this);
}
