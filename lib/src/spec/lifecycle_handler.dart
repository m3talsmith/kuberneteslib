import 'package:json_annotation/json_annotation.dart';

import 'exec_action.dart';
import 'http_get_action.dart';
import 'tcp_socket_action.dart';

part 'lifecycle_handler.g.dart';

// Add these functions at the top of the file, after the imports
ExecAction? _execFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ExecAction.fromJson(json);

Map<String, dynamic>? _execToJson(ExecAction? instance) => instance?.toJson();

HTTPGetAction? _httpGetFromJson(Map<String, dynamic>? json) =>
    json == null ? null : HTTPGetAction.fromJson(json);

Map<String, dynamic>? _httpGetToJson(HTTPGetAction? instance) =>
    instance?.toJson();

TCPSocketAction? _tcpSocketFromJson(Map<String, dynamic>? json) =>
    json == null ? null : TCPSocketAction.fromJson(json);

Map<String, dynamic>? _tcpSocketToJson(TCPSocketAction? instance) =>
    instance?.toJson();

/// Represents a lifecycle handler in Kubernetes.
///
/// LifecycleHandler defines actions that Kubernetes can take at specific points
/// in a container's lifecycle. Key features include:
/// - Command execution
/// - HTTP health checks
/// - TCP socket verification
/// - Multiple handler types
///
/// Common use cases:
/// - Initialization checks
/// - Graceful shutdown
/// - Resource cleanup
/// - Service readiness
///
/// Example:
/// ```dart
/// final handler = LifecycleHandler()
///   ..exec = ExecAction()
///     ..command = ['/bin/sh', '-c', 'cleanup.sh']
///   ..httpGet = HTTPGetAction()
///     ..path = '/healthz'
///     ..port = 8080;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/)
/// for more details about container lifecycle hooks.
@JsonSerializable()
class LifecycleHandler {
  LifecycleHandler();

  /// The exec action to be performed, if specified.
  ///
  /// Optional: Executes a command within the container.
  /// Only one of exec, httpGet, or tcpSocket may be specified.
  @JsonKey(includeIfNull: false, fromJson: _execFromJson, toJson: _execToJson)
  ExecAction? exec;

  /// The HTTP GET action to be performed, if specified.
  ///
  /// Optional: Performs an HTTP GET request to verify container status.
  /// Only one of exec, httpGet, or tcpSocket may be specified.
  @JsonKey(
      includeIfNull: false, fromJson: _httpGetFromJson, toJson: _httpGetToJson)
  HTTPGetAction? httpGet;

  /// The TCP socket action to be performed, if specified.
  ///
  /// Optional: Attempts to open a socket to verify container status.
  /// Only one of exec, httpGet, or tcpSocket may be specified.
  @JsonKey(
      includeIfNull: false,
      fromJson: _tcpSocketFromJson,
      toJson: _tcpSocketToJson)
  TCPSocketAction? tcpSocket;

  factory LifecycleHandler.fromJson(Map<String, dynamic> json) =>
      _$LifecycleHandlerFromJson(json);

  Map<String, dynamic> toJson() => _$LifecycleHandlerToJson(this);
}
