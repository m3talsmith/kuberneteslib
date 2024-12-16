import 'package:json_annotation/json_annotation.dart';

part 'tcp_socket_action.g.dart';

/// Represents a TCP socket probe action in Kubernetes.
///
/// TCPSocketAction defines TCP connection attempts for liveness, readiness,
/// and startup probes. Key features include:
/// - Host targeting
/// - Port specification
/// - Connection testing
/// - Network validation
///
/// Common use cases:
/// - Service availability checks
/// - Port accessibility testing
/// - Network connectivity validation
/// - Container readiness verification
///
/// Example:
/// ```dart
/// final tcpProbe = TCPSocketAction()
///   ..host = 'localhost'
///   ..port = 8080;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-a-tcp-liveness-probe)
/// for more details about TCP socket probes.
@JsonSerializable()
class TCPSocketAction {
  TCPSocketAction();

  /// The host name to connect to.
  ///
  /// Optional: Defaults to pod IP if not specified.
  /// Examples: 'localhost', 'mysql-service', '10.0.0.1'
  late String host;

  /// The port number to connect to.
  ///
  /// Can be specified as:
  /// - Integer (e.g., 80)
  /// - String (e.g., "http")
  /// - Named port from container
  @JsonKey(includeIfNull: false)
  late dynamic port;

  factory TCPSocketAction.fromJson(Map<String, dynamic> json) =>
      _$TCPSocketActionFromJson(json);

  Map<String, dynamic> toJson() => _$TCPSocketActionToJson(this);
}
