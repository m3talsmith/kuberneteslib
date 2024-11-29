import '../local_object_reference.dart';

/// Represents a CephFS volume mount configuration.
class CephFSVolumeSource {
  /// List of Ceph monitors.
  /// More info: https://kubernetes.io/docs/concepts/storage/volumes/#cephfs
  late List<String> monitors;

  /// Used as the mounted root, rather than the full Ceph tree.
  /// Defaults to "/" if unspecified.
  late String path;

  /// Force the ReadOnly setting in VolumeMounts.
  /// Defaults to false.
  late bool readOnly;

  /// The path to the keyring file.
  late String secretFile;

  /// Reference to the authentication secret for user.
  /// If provided, overrides secretFile.
  late LocalObjectReference secretRef;

  /// User is the rados user name.
  /// Default is admin.
  late String user;

  CephFSVolumeSource.fromMap(Map<String, dynamic> data) {
    monitors = data['monitors'] as List<String>;
    path = data['path'];
    readOnly = data['readOnly'];
    secretFile = data['secretFile'];
    secretRef = LocalObjectReference.fromMap(data['secretRef']);
    user = data['user'];
  }
}
