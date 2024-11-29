/// A class representing a TCP socket action with host and port information.
/// Used for configuring TCP socket connections.
class TCPSocketAction {
  /// The host address for the TCP connection.
  late String host;

  /// The port number for the TCP connection.
  /// Can be either an integer or a string representation of a port number.
  late dynamic port;

  /// Creates a [TCPSocketAction] instance from a map of data.
  /// 
  /// The map must contain:
  /// - 'host': String representing the host address
  /// - 'port': Port number (can be int or String)
  TCPSocketAction.fromMap(Map<String, dynamic> data) {
    host = data['host'];
    port = data['port'];
  }
}
