import '../../spec/local_object_reference.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rbd_volume_source.g.dart';

/// Represents a Rados Block Device (RBD) volume in Kubernetes.
///
/// RBDVolumeSource enables pods to use Ceph RBD (Rados Block Device) storage.
/// Key features include:
/// - Network block storage
/// - High availability
/// - Snapshot support
/// - Multi-node access
/// - RADOS cluster integration
///
/// Common use cases:
/// - Database storage
/// - Distributed applications
/// - High-performance workloads
/// - Cloud-native storage
///
/// Example:
/// ```dart
/// final rbdVolume = RBDVolumeSource()
///   ..monitors = ['10.16.154.78:6789', '10.16.154.82:6789']
///   ..image = 'foo-image'
///   ..pool = 'rbd'
///   ..user = 'admin'
///   ..fsType = 'ext4'
///   ..readOnly = false
///   ..keyring = '/etc/ceph/keyring'
///   ..secretRef = LocalObjectReference()..name = 'ceph-secret';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#rbd)
/// for more details about RBD volumes.
@JsonSerializable()
class RBDVolumeSource {
  RBDVolumeSource();

  /// The filesystem type to mount.
  /// 
  /// Required: Must be a filesystem type supported by the host operating system.
  /// Examples: "ext4", "xfs", "ntfs"
  late String fsType;

  /// The rados image name.
  /// 
  /// Required: Name of the RBD image in the pool.
  /// Example: "foo-image"
  late String image;

  /// Path to key ring for RBDUser authentication.
  /// 
  /// Optional: Defaults to /etc/ceph/keyring.
  /// Contains authentication keys for the Ceph cluster.
  late String keyring;

  /// A collection of Ceph monitors.
  /// 
  /// Required: List of Ceph monitor addresses for accessing the RADOS cluster.
  /// Format: ["<ip>:<port>", ...]
  late List<String> monitors;

  /// The rados pool name.
  /// 
  /// Optional: Name of the RADOS pool containing the RBD image.
  /// Defaults to 'rbd'.
  late String pool;

  /// Controls read-only access to the volume.
  /// 
  /// Optional: When true, the volume will be mounted read-only.
  /// Defaults to false.
  late bool readOnly;

  /// Reference to the authentication secret for RBD user.
  /// 
  /// Optional: References a Kubernetes secret containing Ceph authentication credentials.
  /// The secret must exist in the same namespace as the pod.
  late LocalObjectReference secretRef;

  /// The rados user name.
  /// 
  /// Optional: Name of the RADOS user for authentication.
  /// Defaults to 'admin'.
  late String user;

  factory RBDVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$RBDVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$RBDVolumeSourceToJson(this);
}
