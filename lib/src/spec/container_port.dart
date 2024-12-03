import 'package:json_annotation/json_annotation.dart';

part 'container_port.g.dart';

/// Represents a port configuration for a container in Kubernetes.
///
/// ContainerPort enables network communication configuration for containers.
/// Key features include:
/// - Container-to-host port mapping
/// - Protocol specification
/// - Named port references
/// - Host IP binding
///
/// Common use cases:
/// - Web server ports
/// - Database connections
/// - Service mesh communication
/// - Health check endpoints
///
/// Example:
/// ```dart
/// final port = ContainerPort()
///   ..containerPort = 8080
///   ..hostPort = 80
///   ..protocol = 'TCP'
///   ..name = 'http'
///   ..hostIP = '0.0.0.0';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/#exposing-pods-to-the-cluster)
/// for more details about container ports.
@JsonSerializable()
class ContainerPort {
  ContainerPort();

  /// The port number to expose from the container.
  /// 
  /// Required: The port number that the application inside the container
  /// is listening on. Must be a valid port number (1-65535).
  @JsonKey(includeIfNull: false)
  int? containerPort;

  /// The host IP to bind the external port to.
  /// 
  /// Optional: The IP address on the host to bind to.
  /// Default is to bind to all IP addresses (0.0.0.0).
  @JsonKey(includeIfNull: false)
  String? hostIP;

  /// The port number on the host to bind to.
  /// 
  /// Optional: If specified, this must be a valid port number (1-65535).
  /// Note that enabling hostPort may require elevated privileges.
  @JsonKey(includeIfNull: false)
  int? hostPort;

  /// The name for this port.
  /// 
  /// Optional: If specified, this must be a DNS_LABEL name.
  /// Used for service discovery and references in other resources.
  @JsonKey(includeIfNull: false)
  String? name;

  /// The network protocol for this port.
  /// 
  /// Optional: Must be UDP, TCP, or SCTP.
  /// Defaults to TCP if not specified.
  @JsonKey(includeIfNull: false)
  String? protocol;

  factory ContainerPort.fromJson(Map<String, dynamic> json) =>
      _$ContainerPortFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerPortToJson(this);
}
