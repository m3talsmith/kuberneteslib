import 'package:json_annotation/json_annotation.dart';

part 'typed_object_reference.g.dart';

/// Represents a reference to a Kubernetes object across namespaces.
///
/// TypedObjectReference enables referencing Kubernetes resources with
/// complete type and location information. Key features include:
/// - API group specification
/// - Resource kind identification
/// - Cross-namespace references
/// - Type-safe object references
///
/// Common use cases:
/// - Cross-namespace resource binding
/// - Cluster-wide resource references
/// - Multi-tenant resource access
/// - Service mesh configuration
///
/// Example:
/// ```dart
/// final reference = TypedObjectReference()
///   ..apiGroup = 'apps'
///   ..kind = 'Deployment'
///   ..name = 'web-server'
///   ..namespace = 'production';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/)
/// for more details about cross-namespace references.
@JsonSerializable()
class TypedObjectReference {
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
  String name;

  /// The namespace where the referenced resource exists.
  ///
  /// If empty, defaults to the namespace of the referring object.
  String namespace;

  TypedObjectReference()
      : apiGroup = '',
        kind = '',
        name = '',
        namespace = '';

  factory TypedObjectReference.fromJson(Map<String, dynamic> json) =>
      _$TypedObjectReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$TypedObjectReferenceToJson(this);
}
