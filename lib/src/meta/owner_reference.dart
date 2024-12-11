import 'package:json_annotation/json_annotation.dart';

part 'owner_reference.g.dart';

/// Represents a reference to an owning Kubernetes resource.
///
/// OwnerReferences are used to represent relationships between Kubernetes objects,
/// particularly for garbage collection and cascading deletion. They enable:
/// 
/// - Automatic cleanup of dependent objects
/// - Tracking of resource relationships
/// - Implementation of cascading behaviors
///
/// Key use cases:
/// - ReplicaSets owning their Pods
/// - Deployments owning their ReplicaSets
/// - StatefulSets owning their PersistentVolumeClaims
///
/// Example:
/// ```dart
/// final ownerRef = OwnerReference()
///   ..apiVersion = 'apps/v1'
///   ..kind = 'Deployment'
///   ..name = 'nginx-deployment'
///   ..uid = 'a123-456b-789c-0d'
///   ..controller = true
///   ..blockOwnerDeletion = true;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.28/#ownerreference-v1-meta)
/// for more details about owner references.
@JsonSerializable()
class OwnerReference {
  /// The API version of the owner resource.
  /// 
  /// Examples:
  /// - 'v1' for core resources
  /// - 'apps/v1' for Deployments, StatefulSets
  /// - 'batch/v1' for Jobs
  String? apiVersion;

  /// Controls the garbage collection behavior of the owner resource.
  /// 
  /// When true and the owner has the "foregroundDeletion" finalizer,
  /// deletion of the owner will be blocked until this reference is removed.
  /// This ensures proper cleanup of dependent resources.
  bool? blockOwnerDeletion;

  /// Indicates if this reference points to the managing controller.
  /// 
  /// Only one OwnerReference can have controller=true. It's used
  /// to determine which controller is the primary manager of the resource.
  bool? controller;

  /// The kind of the owner resource.
  /// 
  /// Examples:
  /// - 'Pod'
  /// - 'Deployment'
  /// - 'StatefulSet'
  /// - 'Job'
  String? kind;

  /// The name of the owner resource.
  /// 
  /// Must be in the same namespace as the dependent resource,
  /// unless the owner is cluster-scoped.
  String? name;

  /// The unique identifier of the owner resource.
  /// 
  /// This is a system-generated string that uniquely identifies
  /// the owner resource across time and space.
  String? uid;

  /// Creates a new [OwnerReference] with default values.
  OwnerReference();

  factory OwnerReference.fromJson(Map<String, dynamic> json) =>
      _$OwnerReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerReferenceToJson(this);
}
