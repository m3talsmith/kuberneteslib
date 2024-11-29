import 'exec_action.dart';
import 'grpc_action.dart';
import 'http_get_action.dart';
import 'tcp_socket_action.dart';

/// Represents a probe that can be used to check the status of a container.
/// 
/// A probe is a diagnostic performed periodically by the kubelet on a container. 
/// It can be used for liveness, readiness, or startup checks.
class Probe {
  /// Action to execute within the container.
  ExecAction? exec;

  /// Minimum consecutive failures for the probe to be considered failed.
  int? failureThreshold;

  /// GRPC probe configuration.
  GRPCAction? grpc;

  /// HTTP GET probe configuration.
  HTTPGetAction? httpGet;

  /// Number of seconds to wait before performing the first probe.
  int? initialDelaySeconds;

  /// How often (in seconds) to perform the probe.
  int? periodSeconds;

  /// Minimum consecutive successes for the probe to be considered successful.
  int? successThreshold;

  /// TCP socket probe configuration.
  TCPSocketAction? tcpSocket;

  /// Optional grace period in seconds for the container to stop before being killed.
  int? terminationGracePeriodSeconds;

  /// Number of seconds after which the probe times out.
  int? timeoutSeconds;

  /// Creates a [Probe] instance from a map of data.
  /// 
  /// The map should contain keys corresponding to the probe's properties.
  /// Each action type (exec, grpc, httpGet, tcpSocket) will be converted
  /// to its respective object if present in the data.
  Probe.fromMap(Map<String, dynamic> data) {
    if (data['exec'] != null) {
      exec = ExecAction.fromMap(data['exec']);
    }
    failureThreshold = data['failureThreshold'];
    if (data['grpc'] != null) {
      grpc = GRPCAction.fromMap(data['grpc']);
    }
    if (data['httpGet'] != null) {
      httpGet = HTTPGetAction.fromMap(data['httpGet']);
    }
    initialDelaySeconds = data['initialDelaySeconds'];
    periodSeconds = data['periodSeconds'];
    successThreshold = data['successThreshold'];
    if (data['tcpSocket'] != null) {
      tcpSocket = TCPSocketAction.fromMap(data['tcpSocket']);
    }
    terminationGracePeriodSeconds = data['terminationGracePeriodSeconds'];
    timeoutSeconds = data['timeoutSeconds'];
  }
}
