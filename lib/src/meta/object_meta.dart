import 'managed_field_entry.dart';
import 'owner_reference.dart';

/// Implements the [ObjectMeta] Kubernetes API specification. All fields (with
/// the exception of [name]) are optional to support the flexibility of this
/// structure.
///
/// [Reference](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.28/#objectmeta-v1-meta)
class ObjectMeta {
  Map<String, dynamic>? annotations;
  DateTime? creationTimestamp;
  int? deletionGracePeriodSeconds;
  DateTime? deletionTimestamp;
  List<String>? finalizers;
  String? generateName;
  int? generation;
  Map<String, dynamic>? labels;
  List<ManagedFieldEntry>? managedFields;
  late String name;
  String? namespace;
  List<OwnerReference>? ownerReferences;
  String? resourceVersion;
  String? selfLink;
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
}
