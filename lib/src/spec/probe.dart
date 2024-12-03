import 'package:json_annotation/json_annotation.dart';

import 'exec_action.dart';
import 'grpc_action.dart';
import 'http_get_action.dart';
import 'tcp_socket_action.dart';

part 'probe.g.dart';

/// Represents a diagnostic probe for container health checking in Kubernetes.
///
/// Probe enables monitoring container health through various mechanisms. Key features include:
/// - Multiple probe types (exec, HTTP, TCP, gRPC)
/// - Configurable timing parameters
/// - Failure/success thresholds
/// - Grace period handling
///
/// Common use cases:
/// - Liveness checks: Detect if container needs restart
/// - Readiness checks: Determine if container can serve traffic
/// - Startup checks: Verify successful initialization
/// - Health monitoring: Continuous application health verification
///
/// Example:
/// ```dart
/// final probe = Probe()
///   ..httpGet = (HTTPGetAction()
///     ..path = '/health'
///     ..port = 8080)
///   ..initialDelaySeconds = 10
///   ..periodSeconds = 5
///   ..failureThreshold = 3;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)
/// for more details about container probes.
@JsonSerializable()
class Probe {
  Probe();

  /// Command to execute inside the container for health checking.
  /// 
  /// The command's exit status indicates container health:
  /// - 0: Success
  /// - Non-zero: Failure
  @JsonKey(includeIfNull: false)
  ExecAction? exec;

  /// Number of consecutive failures needed to consider the probe failed.
  /// 
  /// Defaults to 3. Minimum value is 1.
  @JsonKey(includeIfNull: false)
  int? failureThreshold;

  /// gRPC-based health checking configuration.
  /// 
  /// Uses gRPC health checking protocol to determine container health.
  @JsonKey(includeIfNull: false)
  GRPCAction? grpc;

  /// HTTP GET request configuration for health checking.
  /// 
  /// Probe succeeds if the HTTP response code is >= 200 and < 400.
  @JsonKey(includeIfNull: false)
  HTTPGetAction? httpGet;

  /// Delay before first probe execution after container starts.
  /// 
  /// Allows time for container initialization. Defaults to 0 seconds.
  @JsonKey(includeIfNull: false)
  int? initialDelaySeconds;

  /// Frequency of probe execution.
  /// 
  /// How often to perform the probe. Defaults to 10 seconds.
  /// Minimum value is 1.
  @JsonKey(includeIfNull: false)
  int? periodSeconds;

  /// Consecutive successes required to consider the probe successful.
  /// 
  /// Defaults to 1. Must be 1 for liveness and startup probes.
  @JsonKey(includeIfNull: false)
  int? successThreshold;

  /// TCP socket connection test configuration.
  /// 
  /// Probe succeeds if connection can be established.
  @JsonKey(includeIfNull: false)
  TCPSocketAction? tcpSocket;

  /// Grace period for stopping container after failed probe.
  /// 
  /// Only applies to liveness probes. Defaults to pod's terminationGracePeriodSeconds.
  @JsonKey(includeIfNull: false)
  int? terminationGracePeriodSeconds;

  /// Maximum time allowed for probe execution.
  /// 
  /// Probe fails if it exceeds this timeout. Defaults to 1 second.
  /// Minimum value is 1.
  @JsonKey(includeIfNull: false)
  int? timeoutSeconds;

  factory Probe.fromJson(Map<String, dynamic> json) => _$ProbeFromJson(json);

  Map<String, dynamic> toJson() => _$ProbeToJson(this);
}
