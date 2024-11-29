import '../../spec/local_object_reference.dart';

/// Represents a ScaleIO persistent volume source in Kubernetes.
/// ScaleIO is a software-defined storage platform that creates a virtual SAN from server-based storage.
class ScaleIOVolumeSource {
  /// The filesystem type to mount.
  /// Must be a filesystem type supported by the host operating system.
  late String fsType;

  /// The ScaleIO Gateway endpoint.
  late String gateway;

  /// The name of the ScaleIO Protection Domain for the configured storage.
  late String protectionDomain;

  /// Specifies whether the volume should be mounted read-only.
  late bool readOnly;

  /// Reference to the secret object containing sensitive information
  /// such as ScaleIO user credentials.
  late LocalObjectReference secretRef;

  /// Flag to enable/disable SSL communication with Gateway.
  late bool sslEnabled;

  /// Indicates whether the storage for a volume should be thick or thin.
  late String storageMode;

  /// The ScaleIO Storage Pool associated with the protection domain.
  late String storagePool;

  /// The name of the storage system as configured in ScaleIO.
  late String system;

  /// The name of a volume already created in the ScaleIO system.
  late String volumeName;

  /// Creates a new [ScaleIOVolumeSource] instance from a map structure.
  /// 
  /// The [data] parameter should contain all the necessary fields as key-value pairs.
  ScaleIOVolumeSource.fromMap(Map<String, dynamic> data) {
    fsType = data['fsType'];
    gateway = data['gateway'];
    protectionDomain = data['protectionDomain'];
    readOnly = data['readOnly'];
    secretRef = LocalObjectReference.fromMap(data['secretRef']);
    sslEnabled = data['sslEnabled'];
    storageMode = data['storageMode'];
    storagePool = data['storagePool'];
    system = data['system'];
    volumeName = data['volumeName'];
  }
}
