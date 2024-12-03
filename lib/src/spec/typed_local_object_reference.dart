import 'package:json_annotation/json_annotation.dart';

part 'typed_local_object_reference.g.dart';

/// Represents a reference to a Kubernetes object within the same namespace.
///
/// TypedLocalObjectReference enables referencing Kubernetes resources with
/// type information. Key features include:
/// - API group specification
/// - Resource kind identification
/// - Local resource referencing
/// - Type-safe object references
///
/// Common use cases:
/// - Volume claims
/// - Resource bindings
/// - Cross-resource references
/// - Service targeting
///
/// Example:
/// ```dart
/// final reference = TypedLocalObjectReference()
///   ..apiGroup = 'apps'
///   ..kind = 'Deployment'
///   ..name = 'web-server';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/#object-references)
/// for more details about object references.
@JsonSerializable()
class TypedLocalObjectReference {
  /// The API group of the referenced resource.
  /// 
  /// Examples:
  /// - 'apps' for Deployments
  /// - 'batch' for Jobs
  /// - 'networking.k8s.io' for Ingresses
  String apiGroup;

  /// The kind of resource being referenced.
  /// 
  /// Examples:
  /// - 'Deployment'
  /// - 'StatefulSet'
  /// - 'Service'
  String kind;

  /// The name of the referenced resource.
  /// 
  /// Must be in the same namespace as the referring resource.
  String name;

  TypedLocalObjectReference()
      : apiGroup = '',
        kind = '',
        name = '';

  factory TypedLocalObjectReference.fromJson(Map<String, dynamic> json) =>
      _$TypedLocalObjectReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$TypedLocalObjectReferenceToJson(this);
}
