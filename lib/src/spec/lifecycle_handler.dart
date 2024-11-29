import 'exec_action.dart';
import 'http_get_action.dart';
import 'tcp_socket_action.dart';

/// A handler for Kubernetes lifecycle hooks that can execute different types of actions.
///
/// This class supports three types of actions:
/// * [ExecAction] - Executes a command inside a container
/// * [HTTPGetAction] - Performs an HTTP GET request
/// * [TCPSocketAction] - Attempts to open a TCP socket
class LifecycleHandler {
  /// The exec action to be performed, if specified
  ExecAction? exec;

  /// The HTTP GET action to be performed, if specified
  HTTPGetAction? httpGet;

  /// The TCP socket action to be performed, if specified
  TCPSocketAction? tcpSocket;

  /// Creates a [LifecycleHandler] from a JSON map structure.
  /// 
  /// The map should contain one of the following keys:
  /// * `exec` - For executing commands
  /// * `httpGet` - For HTTP GET requests
  /// * `tcpSocket` - For TCP socket actions
  LifecycleHandler.fromMap(Map<String, dynamic> data) {
    if (data['exec'] != null) {
      exec = ExecAction.fromMap(data['exec']);
    }
    if (data['httpGet'] != null) {
      httpGet = HTTPGetAction.fromMap(data['httpGet']);
    }
    if (data['tcpSocket'] != null) {
      tcpSocket = TCPSocketAction.fromMap(data['tcpSocket']);
    }
  }
}
