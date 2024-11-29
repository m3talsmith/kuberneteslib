/// Represents a gRPC action configuration with port and service information.
class GRPCAction {
  /// The port number on which the gRPC service is running.
  late int port;

  /// The name or identifier of the gRPC service.
  late String service;

  /// Creates a new [GRPCAction] instance from a map of data.
  /// 
  /// The map must contain:
  /// - 'port': An integer representing the port number
  /// - 'service': A string representing the service name
  GRPCAction.fromMap(Map<String, dynamic> data) {
    port = data['port'];
    service = data['service'];
  }
}
