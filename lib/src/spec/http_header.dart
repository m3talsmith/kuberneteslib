import 'package:json_annotation/json_annotation.dart';

part 'http_header.g.dart';

/// Represents an HTTP header in Kubernetes HTTP actions.
///
/// HTTPHeader defines name-value pairs for HTTP request headers used in
/// health checks and probes. Key features include:
/// - Custom header definition
/// - Standard HTTP header support
/// - Multiple header values
/// - Request customization
///
/// Common use cases:
/// - Authentication headers
/// - Content type specification
/// - Custom routing headers
/// - API versioning headers
///
/// Example:
/// ```dart
/// final header = HTTPHeader()
///   ..name = 'Authorization'
///   ..value = 'Bearer token123';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#configure-probes)
/// for more details about HTTP probe configuration.
@JsonSerializable()
class HTTPHeader {
  HTTPHeader();

  /// The name of the HTTP header.
  ///
  /// Required: Must be a valid HTTP header name as per RFC 7230.
  /// Example: 'Accept', 'Authorization', 'Content-Type'
  late String name;

  /// The value of the HTTP header.
  ///
  /// Required: The header value to be sent with the HTTP request.
  /// Example: 'application/json', 'Bearer token123'
  late String value;

  factory HTTPHeader.fromJson(Map<String, dynamic> json) =>
      _$HTTPHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$HTTPHeaderToJson(this);
}
