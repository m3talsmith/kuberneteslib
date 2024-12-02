/// Implements the [OwnerReference] portion of the Kubernetes API specification.
///
/// An OwnerReference contains enough information to let you identify an owning
/// object. An owning object must be in the same namespace as the dependent, or
/// be cluster-scoped, so there is no namespace field.
///
/// [Reference](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.28/#ownerreference-v1-meta)
class OwnerReference {
  /// The API version of the owner object.
  late String apiVersion;

  /// If true, AND if the owner has the "foregroundDeletion" finalizer, then
  /// the owner cannot be deleted from the key-value store until this
  /// reference is removed.
  late bool blockOwnerDeletion;

  /// If true, this reference points to the managing controller.
  late bool controller;

  /// The kind of the owner object.
  late String kind;

  /// The name of the owner object.
  late String name;

  /// The UID of the owner object.
  late String uid;

  /// Creates an [OwnerReference] instance from a Map representation.
  ///
  /// [data] should contain all the required fields for an OwnerReference:
  /// - apiVersion
  /// - blockOwnerDeletion
  /// - controller
  /// - kind
  /// - name
  /// - uid
  ///
  /// Throws if any required fields are missing from the map.
  OwnerReference.fromMap(Map<String, dynamic> data) {
    apiVersion = data['apiVersion'];
    blockOwnerDeletion = data['blockOwnerDeletion'];
    controller = data['controller'];
    kind = data['kind'];
    name = data['name'];
    uid = data['uid'];
  }

  Map<String, dynamic> toMap() => {
        'apiVersion': apiVersion,
        'blockOwnerDeletion': blockOwnerDeletion,
        'controller': controller,
        'kind': kind,
        'name': name,
        'uid': uid,
      }..removeWhere(
          (key, value) => value == null,
        );
}
