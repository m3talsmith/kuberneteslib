import '../../spec/key_to_path.dart';

/// Represents a volume source that references a Kubernetes Secret.
///
/// This class adapts a Secret into a volume that can be mounted into pods.
/// The Secret must exist in the same namespace as the pod that mounts it.
class SecretVolumeSource {
  /// Default mode bits (permission) to use for mounted secret files.
  /// Defaults to 0644 if not specified.
  /// Optional: mode bits to use on created files by default.
  int? defaultMode;

  /// List of secret keys and their paths.
  /// If specified, the listed keys will be projected into the specified paths.
  /// If unspecified, all keys of the Secret will be mounted.
  List<KeyToPath>? items;

  /// Specify whether the Secret must be defined.
  /// When true, the volume mount will fail if the secret doesn't exist.
  /// When false, the volume mount will succeed even if the secret doesn't exist.
  bool? optional;

  /// Name of the Secret in the pod's namespace to use.
  /// This field is required when using a Secret volume.
  String? secretName;

  /// Creates a new [SecretVolumeSource] instance from a map structure.
  ///
  /// [data] should be a map containing the secret volume configuration.
  SecretVolumeSource.fromMap(Map<String, dynamic> data) {
    defaultMode = data['defaultMode'];
    if (data['items'] != null) {
      items = [];
      for (var e in data['items']) {
        items!.add(KeyToPath.fromMap(e));
      }
    }
    optional = data['optional'];
    secretName = data['secretName'];
  }
}
