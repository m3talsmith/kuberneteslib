import 'package:json_annotation/json_annotation.dart';

import '../resource/resource_kind.dart';
import 'object_spec.dart';
import 'pod_spec.dart';

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
    return Spec.fromJson(json, kind: ResourceKind.values.firstWhere(
      (k) => k.name == json['kind'],
      orElse: () => ResourceKind.pod,
    )).spec!;
  }

  @override
  Map<String, dynamic> toJson(ObjectSpec object) => object.toJson();
}

/// Factory for creating Kubernetes resource specifications.
///
/// Spec provides a centralized way to create and manage different types of
/// Kubernetes resource specifications. Key features include:
/// - Resource kind-based instantiation
/// - JSON serialization support
/// - Type-safe specification handling
///
/// Common use cases:
/// - Pod specification creation
/// - Resource definition parsing
/// - Multi-resource management
/// - Specification serialization
///
/// Example:
/// ```dart
/// final podSpec = Spec.fromJson({
///   'containers': [{
///     'name': 'web',
///     'image': 'nginx:1.14.2'
///   }]
/// }, kind: ResourceKind.pod);
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/)
/// for more details about resource specifications.
class Spec {
  /// The actual resource specification instance.
  /// 
  /// Uses [ObjectSpecConverter] for JSON serialization/deserialization.
  @ObjectSpecConverter()
  ObjectSpec? spec;

  Spec({required this.spec});

  /// Creates a Spec instance from JSON based on the resource kind.
  /// 
  /// Parameters:
  /// - [data]: Raw JSON map containing the specification
  /// - [kind]: Type of Kubernetes resource being created
  /// 
  /// Currently supports:
  /// - Pod specifications (ResourceKind.pod)
  factory Spec.fromJson(Map<String, dynamic> data,
      {required ResourceKind kind}) {
    data['kind'] = kind.name;
    switch (kind) {
      case ResourceKind.pod:
        return Spec(spec: PodSpec.fromJson(data));
      default:
        return Spec(spec: PodSpec.fromJson(data));
    }
  }

  /// Converts this Spec to a JSON representation.
  Map<String, dynamic> toJson() => spec?.toJson() ?? {};
}
