import 'package:json_annotation/json_annotation.dart';

import '../../kuberneteslib.dart';
import '../spec/object_spec.dart';

/// JSON converter for Kubernetes resource specifications.
///
/// Enables automatic conversion between JSON and specific resource spec types
/// based on the resource kind. Used in conjunction with @JsonSerializable.
///
/// Example:
/// ```dart
/// @ObjectSpecConverter()
/// ObjectSpec? spec;
/// ```
class ObjectSpecConverter implements JsonConverter<ObjectSpec, Map<String, dynamic>> {
  const ObjectSpecConverter();
  
  @override
  ObjectSpec fromJson(Map<String, dynamic> json) {
    return Spec.fromJson(json, kind: json['kind']).spec!;
  }

  @override
  Map<String, dynamic> toJson(ObjectSpec object) => object.toJson();
}