import 'http_header.dart';

/// Represents an HTTP GET action configuration for health checks or probes.
class HTTPGetAction {
  /// The host name to connect to, defaults to the pod IP.
  String? host;

  /// Custom headers to set in the request.
  List<HTTPHeader>? httpHeaders;

  /// Path to access on the HTTP server.
  String? path;

  /// Port number or name to access on the container.
  /// If specified as a number, it must be in the range 1 to 65535.
  dynamic port;

  /// Scheme to use for connecting to the host.
  /// Defaults to HTTP.
  String? scheme;

  /// Creates a new HTTPGetAction instance from a map structure.
  /// 
  /// [data] should contain the following keys:
  /// - host: String (optional)
  /// - httpHeaders: List of header objects (optional)
  /// - path: String (optional)
  /// - port: number or string (required)
  /// - scheme: String (optional)
  HTTPGetAction.fromMap(Map<String, dynamic> data) {
    host = data['host'];
    if (data['httpHeaders'] != null) {
      httpHeaders = [];
      for (var e in data['httpHeaders']) {
        httpHeaders!.add(HTTPHeader.fromMap(e));
      }
    }
    path = data['path'];
    port = data['port'];
    scheme = data['scheme'];
  }
}
