/// A selector for Kubernetes Secret keys that allows referencing specific entries in a Secret.
class SecretKeySelector {
  /// The key of the secret to select from.
  /// Must be a valid secret key.
  String? key;

  /// Name of the referent Secret.
  /// More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  String? name;

  /// Specify whether the Secret or its key must be defined.
  /// When true, the secret referenced may be missing, and null will be returned.
  /// When false or not specified, the secret referenced must exist and contain the key.
  bool? optional;

  /// Creates a new [SecretKeySelector] instance from a map structure.
  ///
  /// The map should contain the following keys:
  /// - 'key': The key within the Secret
  /// - 'name': The name of the Secret
  /// - 'optional': Whether the Secret or key is optional
  SecretKeySelector.fromMap(Map<String, dynamic> data) {
    key = data['key'];
    name = data['name'];
    optional = data['optional'];
  }

  Map<String, dynamic> toMap() => {
        'key': key,
        'name': name,
        'optional': optional,
      }..removeWhere(
          (key, value) => value == null,
        );
}
