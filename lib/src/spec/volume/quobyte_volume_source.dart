/// Represents a Quobyte volume source configuration for Kubernetes volumes.
/// 
/// Quobyte is a software-defined storage solution that can be used as a
/// persistent volume in Kubernetes.
class QuobyteVolumeSource {
  /// The group to map volume access to.
  late String group;

  /// Whether the volume should be mounted read-only.
  late bool readOnly;

  /// The Quobyte registry address(es) for volume management.
  /// Format: "host:port" or multiple entries comma separated.
  late String registry;

  /// The tenant to use for the volume access.
  /// If not specified, the default tenant will be used.
  late String tenant;

  /// The user to map volume access to.
  late String user;

  /// The name of the Quobyte volume to mount.
  late String volume;

  /// Creates a new [QuobyteVolumeSource] instance from a map structure.
  /// 
  /// The map should contain the following keys:
  /// - group: String
  /// - readOnly: bool
  /// - registry: String
  /// - tenant: String
  /// - user: String
  /// - volume: String
  QuobyteVolumeSource.fromMap(Map<String, dynamic> data) {
    group = data['group'];
    readOnly = data['readOnly'];
    registry = data['registry'];
    tenant = data['tenant'];
    user = data['user'];
    volume = data['volume'];
  }
}
