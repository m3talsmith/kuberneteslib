import 'package:json_annotation/json_annotation.dart';

part 'local_object_reference.g.dart';

/// Represents a reference to a local Kubernetes object within the same namespace.
///
/// LocalObjectReference enables referencing Kubernetes resources that exist in
/// the same namespace. Key features include:
/// - Same-namespace references
/// - Name-based lookup
/// - Resource linking
/// - Cross-resource relationships
///
/// Common use cases:
/// - Secret references
/// - ConfigMap references
/// - ServiceAccount references
/// - PersistentVolumeClaim references
///
/// Example:
/// ```dart
/// final reference = LocalObjectReference()
///   ..name = 'mysql-credentials';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/overview/working-with-objects/names-uids/)
/// for more details about object references.
@JsonSerializable()
class LocalObjectReference {
  /// Creates a new LocalObjectReference with an empty name.
  LocalObjectReference({this.name});

  /// The name of the referenced Kubernetes object.
  ///
  /// Required: Must be a valid object name in the same namespace.
  /// The name must be unique within the namespace.
  String? name;

  factory LocalObjectReference.fromJson(Map<String, dynamic> json) =>
      _$LocalObjectReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$LocalObjectReferenceToJson(this);
}
