import 'package:json_annotation/json_annotation.dart';

import 'managed_field_entry.dart';
import 'owner_reference.dart';

part 'object_meta.g.dart';

/// Represents Kubernetes object metadata that is common to all Kubernetes objects.
///
/// ObjectMeta contains metadata that all persisted Kubernetes resources must have,
/// including:
/// - Basic identification (name, namespace, UID)
/// - Versioning information (resourceVersion, generation)
/// - Management information (labels, annotations, ownerReferences)
/// - Lifecycle information (creationTimestamp, deletionTimestamp)
///
/// Example:
/// ```dart
/// final metadata = ObjectMeta()
///   ..name = 'my-pod'
///   ..namespace = 'default'
///   ..labels = {'app': 'web', 'env': 'prod'}
///   ..annotations = {'kubernetes.io/created-by': 'controller'};
/// ```
///
/// This class is used extensively throughout the Kubernetes API for resource
/// identification and management. It's a core component of the
/// [Resource](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.28/#objectmeta-v1-meta)
/// model.
@JsonSerializable()
class ObjectMeta {
  /// Creates a new [ObjectMeta] instance with a required [name].
  ObjectMeta() : name = '';

  /// Unstructured key-value pairs that can be set by external tools.
  /// 
  /// Annotations are not used for selection and cannot be used by kubectl
  /// or other tools for matching objects. They are purely informational.
  @JsonKey(includeFromJson: false)
  Map<String, dynamic>? annotations;

  /// Server time when this object was created.
  /// 
  /// Populated by the system. Read-only.
  @JsonKey(includeFromJson: false)
  DateTime? creationTimestamp;

  /// Grace period before the object is forcefully terminated.
  /// 
  /// When deleting an object, this value determines how long the system will
  /// wait for the object to be gracefully terminated before force deleting it.
  @JsonKey(includeFromJson: false)
  int? deletionGracePeriodSeconds;

  /// Time after which this resource will be deleted.
  /// 
  /// Set by the system when a delete request is received.
  /// Read-only.
  @JsonKey(includeFromJson: false)
  DateTime? deletionTimestamp;

  /// List of actions that must complete before the object is deleted.
  /// 
  /// Populated by the system when deletion is requested.
  @JsonKey(includeFromJson: false)
  List<String>? finalizers;

  /// Optional prefix for generating a unique name.
  /// 
  /// If specified, the server will create a unique name based on this prefix
  /// when the object is created.
  @JsonKey(includeFromJson: false)
  String? generateName;

  /// A sequence number representing a specific generation of the desired state.
  /// 
  /// Incremented by the server every time the object is modified.
  @JsonKey(includeFromJson: false)
  int? generation;

  /// Key-value pairs for organizing and selecting objects.
  /// 
  /// Labels can be used with kubectl and API queries to select objects based
  /// on their characteristics.
  @JsonKey(includeFromJson: false)
  Map<String, dynamic>? labels;

  /// List of objects managing this object's fields.
  /// 
  /// Records which fields are managed by which managers, used for merge
  /// strategies and validation.
  @JsonKey(includeFromJson: false)
  List<ManagedFieldEntry>? managedFields;

  /// Required: unique identifier within a namespace.
  String name;

  /// The namespace this object belongs to.
  /// 
  /// Namespaces provide a scope for names. Cannot be updated.
  @JsonKey(includeFromJson: false)
  String? namespace;

  /// References to owning objects.
  /// 
  /// Used for garbage collection and cascading deletion.
  @JsonKey(includeFromJson: false)
  List<OwnerReference>? ownerReferences;

  /// Internal version of this object.
  /// 
  /// Used for optimistic concurrency, change detection, and the watch operation.
  @JsonKey(includeFromJson: false)
  String? resourceVersion;

  /// URL representing this object. Read-only.
  @JsonKey(includeFromJson: false)
  String? selfLink;

  /// Unique identifier across space and time. Read-only.
  @JsonKey(includeFromJson: false)
  String? uid;

  factory ObjectMeta.fromJson(Map<String, dynamic> json) =>
      _$ObjectMetaFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectMetaToJson(this);
}
