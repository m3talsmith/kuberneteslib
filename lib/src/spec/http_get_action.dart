import 'package:json_annotation/json_annotation.dart';

import 'http_header.dart';

part 'http_get_action.g.dart';

List<HTTPHeader>? _httpHeadersFromJson(List<dynamic>? json) =>
    json?.map((e) => HTTPHeader.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>>? _httpHeadersToJson(List<HTTPHeader>? instance) =>
    instance?.map((e) => e.toJson()).toList();

/// Represents an HTTP GET action in Kubernetes.
///
/// HTTPGetAction defines how to perform HTTP GET requests for health checking
/// and lifecycle management. Key features include:
/// - Custom host targeting
/// - Header configuration
/// - Path specification
/// - Port selection
/// - Protocol scheme selection
///
/// Common use cases:
/// - Health checks
/// - Readiness probes
/// - Liveness probes
/// - Startup probes
///
/// Example:
/// ```dart
/// final httpGet = HTTPGetAction()
///   ..path = '/health'
///   ..port = 8080
///   ..scheme = 'HTTP'
///   ..httpHeaders = [
///     HTTPHeader()
///       ..name = 'Custom-Header'
///       ..value = 'value'
///   ];
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-a-liveness-http-request)
/// for more details about HTTP probes.
@JsonSerializable()
class HTTPGetAction {
  HTTPGetAction(
      {this.host, this.httpHeaders, this.path, this.port, this.scheme});

  /// The hostname to connect to.
  ///
  /// Optional: Defaults to the pod IP. You probably want to set
  /// "Host" in httpHeaders instead.
  @JsonKey(includeIfNull: false)
  String? host;

  /// Custom headers to set in the request.
  ///
  /// HTTP headers to set in the request. HTTP allows repeated headers.
  @JsonKey(
      includeIfNull: false,
      fromJson: _httpHeadersFromJson,
      toJson: _httpHeadersToJson)
  List<HTTPHeader>? httpHeaders;

  /// Path to access on the HTTP server.
  ///
  /// Optional: Defaults to '/'.
  @JsonKey(includeIfNull: false)
  String? path;

  /// Port number or name to access on the container.
  ///
  /// Required: Number must be in the range 1 to 65535.
  /// Name must be an IANA_SVC_NAME.
  @JsonKey(includeIfNull: false)
  dynamic port;

  /// Scheme to use for connecting to the host.
  ///
  /// Optional: Defaults to HTTP. Possible values are HTTP and HTTPS.
  @JsonKey(includeIfNull: false)
  String? scheme;

  factory HTTPGetAction.fromJson(Map<String, dynamic> json) =>
      _$HTTPGetActionFromJson(json);

  Map<String, dynamic> toJson() => _$HTTPGetActionToJson(this);
}
