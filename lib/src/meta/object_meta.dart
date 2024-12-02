import 'managed_field_entry.dart';
import 'owner_reference.dart';

/// Implements the [ObjectMeta] Kubernetes API specification. All fields (with
/// the exception of [name]) are optional to support the flexibility of this
/// structure.
///
/// [Reference](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.28/#objectmeta-v1-meta)
class ObjectMeta {
  /// Annotations is an unstructured key value map stored with a resource that may be
  /// set by external tools to store and retrieve arbitrary metadata.
  Map<String, dynamic>? annotations;

  /// CreationTimestamp is a timestamp representing the server time when this object
  /// was created.
  DateTime? creationTimestamp;

  /// Number of seconds allowed for this object to gracefully terminate before
  /// it will be removed from the system.
  int? deletionGracePeriodSeconds;

  /// DeletionTimestamp is RFC 3339 date and time at which this resource will be deleted.
  DateTime? deletionTimestamp;

  /// List of finalizers that must be executed before the object is deleted.
  List<String>? finalizers;

  /// GenerateName is an optional prefix, used by the server, to generate a unique
  /// name for the object if [name] is not specified.
  String? generateName;

  /// A sequence number representing a specific generation of the desired state.
  int? generation;

  /// Map of string keys and values that can be used to organize and categorize objects.
  Map<String, dynamic>? labels;

  /// List of objects that manage this object's fields.
  List<ManagedFieldEntry>? managedFields;

  /// Name must be unique within a namespace. Required when creating resources.
  late String name;

  /// Namespace defines the space within which each name must be unique.
  String? namespace;

  /// List of objects that own this object.
  List<OwnerReference>? ownerReferences;

  /// An opaque value that represents the internal version of this object.
  String? resourceVersion;

  /// SelfLink is a URL representing this object.
  /// Populated by the system. Read-only.
  String? selfLink;

  /// UID is a unique identifier in time and space for this object.
  /// Populated by the system. Read-only.
  String? uid;

  /// Takes a [Map] and pulls out the necessary information.
  ObjectMeta.fromMap(Map<String, dynamic> data) {
    annotations = data['annotations'];
    if (data['creationTimestamp'] != null) {
      creationTimestamp = DateTime.parse(data['creationTimestamp']);
    }
    deletionGracePeriodSeconds = data['deletionGracePeriodSeconds'];
    if (data['deletionTimestamp'] != null) {
      deletionTimestamp = DateTime.parse(data['deletionTimestamp']);
    }
    finalizers = data['finalizers'];
    generateName = data['generateName'];
    generation = data['generation'];
    labels = data['labels'];
    if (data['managedFields'] != null) {
      managedFields = [];
      for (var e in data['managedFields']) {
        managedFields!.add(ManagedFieldEntry.fromMap(e));
      }
    }
    name = data['name'];
    namespace = data['namespace'];
    if (data['ownerReferences'] != null) {
      ownerReferences = [];
      for (var e in data['ownerReferences']) {
        ownerReferences!.add(OwnerReference.fromMap(e));
      }
    }
    resourceVersion = data['resourceVersion'];
    selfLink = data['selfLink'];
    uid = data['uid'];
  }

  Map<String, dynamic> toMap() => {
        'annotations': annotations,
        'creationTimestamp': creationTimestamp,
        'deletionGracePeriodSeconds': deletionGracePeriodSeconds,
        'deletionTimestamp': deletionTimestamp,
        'finalizers': finalizers,
        'generateName': generateName,
        'generation': generation,
        'labels': labels,
        'managedFields': (managedFields != null)
            ? managedFields!.map(
                (e) => e.toMap(),
              )
            : null,
        'name': name,
        'namespace': namespace,
        'ownerReferences': (ownerReferences != null)
            ? ownerReferences!.map(
                (e) => e.toMap(),
              )
            : null,
        'resourceVersion': resourceVersion,
        'selfLink': selfLink,
        'uid': uid,
      }..removeWhere(
          (key, value) => value == null,
        );
}
