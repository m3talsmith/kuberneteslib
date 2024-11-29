import '../../spec/local_object_reference.dart';

/// Represents a Rados Block Device (RBD) volume source in Kubernetes.
/// 
/// RBD volumes are network block devices that allow mounting of Ceph RBD (Rados Block Device)
/// images as volumes in Kubernetes pods.
class RBDVolumeSource {
  /// The filesystem type to mount.
  /// Examples: "ext4", "xfs", "ntfs"
  late String fsType;

  /// The rados image name.
  /// Example: "foo-image"
  late String image;

  /// Keyring is the path to key ring for RBDUser.
  /// Default is /etc/ceph/keyring.
  late String keyring;

  /// A collection of Ceph monitors.
  /// These are the addresses through which the Ceph network can be accessed.
  late List<String> monitors;

  /// The rados pool name.
  /// Default is 'rbd'.
  late String pool;

  /// Whether to mount the volume as read-only.
  late bool readOnly;

  /// Reference to the authentication secret for RBD user.
  /// More details can be found in secrets and ConfigMaps documentation.
  late LocalObjectReference secretRef;

  /// The rados user name.
  /// Default is admin.
  late String user;

  /// Creates a new [RBDVolumeSource] instance from a map structure.
  /// 
  /// The [data] parameter should contain all the necessary fields to initialize
  /// the RBD volume source configuration.
  RBDVolumeSource.fromMap(Map<String, dynamic> data) {
    fsType = data['fsType'];
    image = data['image'];
    keyring = data['keyring'];
    monitors = data['monitors'] as List<String>;
    pool = data['pool'];
    readOnly = data['readOnly'];
    secretRef = LocalObjectReference.fromMap(data['secretRef']);
    user = data['user'];
  }
}
