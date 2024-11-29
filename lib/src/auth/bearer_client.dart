import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';

import 'cluster_auth_client.dart';

/// A client that implements bearer token authentication for Kubernetes.
///
/// This client adds the necessary Authorization header with a bearer token
/// to authenticate requests to the Kubernetes API.
class BearerClient extends BaseClient implements ClusterAuthClient {
  /// Creates a new bearer token client.
  /// 
  /// [token] is the bearer token used for authentication.
  /// [expirationTimestamp] optionally specifies when the token expires.
  BearerClient({required this.token, this.expirationTimestamp});

  /// The bearer token used for authentication
  final String token;

  /// Optional timestamp indicating when the token expires
  final DateTime? expirationTimestamp;

  /// Sends an HTTP request with bearer token authentication.
  /// 
  /// Adds the Authorization header with the bearer token and handles SSL/TLS
  /// configuration. The [badCertificateCallback] can be used to customize
  /// certificate validation behavior.
  @override
  Future<StreamedResponse> send(
    BaseRequest request, {
    bool Function(X509Certificate, String, int)? badCertificateCallback,
  }) async {
    badCertificateCallback ??= (_, __, ___) => true;

    if (expirationTimestamp != null) {
      final now = DateTime.now();
      if (expirationTimestamp!.isBefore(now)) {
        throw Exception('Bearer token is expired');
      }
    }

    request.headers['user-agent'] = ClusterAuthClient.userAgent;
    request.headers['Authorization'] = 'Bearer $token';
    var context = SecurityContext()..allowLegacyUnsafeRenegotiation = true;
    var client = HttpClient(context: context)
      ..badCertificateCallback = badCertificateCallback;
    return IOClient(client).send(request);
  }
}
