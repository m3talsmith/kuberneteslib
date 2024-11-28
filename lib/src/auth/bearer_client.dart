import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';

import 'cluster_auth_client.dart';

/// BearerClient implements a [ClusterAuthClient]. It uses the
/// [bearer token process](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#putting-a-bearer-token-in-a-request)
/// to authenticate against a Kubernetes API.
class BearerClient extends BaseClient implements ClusterAuthClient {
  BearerClient({required this.token, this.expirationTimestamp});

  final String token;
  final DateTime? expirationTimestamp;

  /// Modifies a [BaseRequest] and creates a [SecurityContext] for an http call
  /// to the Kubernetes API; then sends it, using bearer token details,
  /// returning a [StreamedResponse].
  ///
  /// By default, [badCertificateCallback] is set to ignore bad certificates
  /// (such as self signed certificates).
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
