/// Implements the [OwnerReference] portion of the specification.
///
/// [Reference](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.28/#ownerreference-v1-meta)
class OwnerReference {
  late String apiVersion;
  late bool blockOwnerDeletion;
  late bool controller;
  late String kind;
  late String name;
  late String uid;

  /// Takes a [Map] and pulls out the necessary information.
  OwnerReference.fromMap(Map<String, dynamic> data) {
    apiVersion = data['apiVersion'];
    blockOwnerDeletion = data['blockOwnerDeletion'];
    controller = data['controller'];
    kind = data['kind'];
    name = data['name'];
    uid = data['uid'];
  }
}
