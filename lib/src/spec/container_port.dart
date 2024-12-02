/// Represents a container port configuration in Kubernetes.
///
/// This class defines the port mapping between a container and its host,
/// including protocol information and naming.
class ContainerPort {
  /// The port number inside the container.
  int? containerPort;

  /// The host IP address to bind to (optional).
  String? hostIP;

  /// The port number on the host to bind to (optional).
  int? hostPort;

  /// The name of this port mapping.
  String? name;

  /// The protocol for this port (e.g., 'TCP', 'UDP').
  String? protocol;

  /// Creates a [ContainerPort] instance from a map of values.
  ///
  /// The map should contain the following keys:
  /// * 'containerPort': The port number inside the container
  /// * 'hostIP': (Optional) The host IP to bind to
  /// * 'hostPort': (Optional) The port number on the host
  /// * 'name': The name of this port mapping
  /// * 'protocol': The protocol to use for this port
  ContainerPort.fromMap(Map<String, dynamic> data) {
    containerPort = data['containerPort'];
    hostIP = data['hostIP'];
    hostPort = data['hostPort'];
    name = data['name'];
    protocol = data['protocol'];
  }

  Map<String, dynamic> toMap() => {
        'containerPort': containerPort,
        'hostIP': hostIP,
        'hostPort': hostPort,
        'name': name,
        'protocol': protocol,
      }..removeWhere(
          (key, value) => value == null,
        );
}
