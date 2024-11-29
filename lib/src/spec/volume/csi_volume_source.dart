import '../local_object_reference.dart';

/// Represents a Container Storage Interface (CSI) volume source configuration.
/// CSI allows storage drivers to be developed independently from Kubernetes.
class CSIVolumeSource {
  /// The name of the CSI driver that handles this volume.
  /// This field is required.
  late String driver;

  /// Filesystem type to mount. Must be a filesystem type supported by the host OS.
  /// Examples include "ext4", "xfs", "ntfs".
  late String fsType;

  /// Reference to the secret object containing sensitive information to pass to
  /// the CSI driver to complete the CSI NodePublishVolume call.
  /// This secret will be mounted into the pod where the volume is attached.
  late LocalObjectReference nodePublishSecretRef;

  /// Specifies whether the volume should be mounted as read-only.
  /// If true, the volume will be mounted with read-only permissions.
  /// Defaults to false.
  late bool readOnly;

  /// Extra parameters to pass to the CSI driver when attaching the volume.
  /// These parameters are specific to the CSI driver and can be used to
  /// configure driver-specific behavior.
  late Map<String, dynamic> volumeAttributes;

  /// Creates a new [CSIVolumeSource] instance from a map structure.
  /// 
  /// The [data] parameter must contain the following keys:
  /// - 'driver': String identifying the CSI driver
  /// - 'fsType': String specifying the filesystem type
  /// - 'nodePublishSecretRef': Map containing secret reference details
  /// - 'readOnly': Boolean indicating read-only status
  /// - 'volumeAttributes': Map of string key-value pairs for driver parameters
  CSIVolumeSource.fromMap(Map<String, dynamic> data) {
    driver = data['driver'];
    fsType = data['fsType'];
    nodePublishSecretRef =
        LocalObjectReference.fromMap(data['nodePublishSecretRef']);
    readOnly = data['readOnly'];
    volumeAttributes = data['volumeAttributes'] as Map<String, dynamic>;
  }
}
