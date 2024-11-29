import '../../spec/local_object_reference.dart';

/// Represents a FlexVolume source in Kubernetes.
/// FlexVolume is a volume plugin that allows users to mount vendor-specific
/// storage to their pods.
class FlexVolumeSource {
  /// The driver to use for this flex volume, as registered with Kubernetes.
  late String driver;

  /// Filesystem type to mount. Must be a filesystem type supported by the host
  /// operating system.
  late String fsType;

  /// Optional: Extra command options to pass to the flex volume driver when
  /// mounting.
  late Map<String, dynamic> options;

  /// Optional: Defaults to false (read/write). ReadOnly here will force
  /// the ReadOnly setting in VolumeMounts.
  late bool readOnly;

  /// Optional: SecretRef is a reference to the secret object containing
  /// sensitive information to pass to the flex volume driver for the mount.
  late LocalObjectReference secretRef;

  /// Creates a new FlexVolumeSource instance from a map structure.
  /// 
  /// [data] should contain the following keys:
  /// - driver: String identifying the flex volume driver
  /// - fsType: String identifying the filesystem type
  /// - options: Map of string keys and values for driver options
  /// - readOnly: Boolean indicating if volume is read-only
  /// - secretRef: Map containing secret reference details
  FlexVolumeSource.fromMap(Map<String, dynamic> data) {
    driver = data['driver'];
    fsType = data['fsType'];
    options = {};
    for (var e in (data['options'] as Map<String, dynamic>).entries) {
      options[e.key] = e.value;
    }
    readOnly = data['readOnly'];
    secretRef = LocalObjectReference.fromMap(data['secretRef']);
  }
}
