import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:http/io_client.dart';

import 'cluster_auth_client.dart';

/// CertClient implements a [ClusterAuthClient]. It uses the
/// [client certification process](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#x509-client-certificates)
/// to authenticate against a Kubernetes API.
class CertClient extends BaseClient implements ClusterAuthClient {
  CertClient({
    required this.clientCertificateAuthority,
    required this.clientCertificateData,
    required this.clientKeyData,
  });

  final Uint8List clientCertificateAuthority;
  final Uint8List clientCertificateData;
  final Uint8List clientKeyData;

  /// Modifies a [BaseRequest] and creates a [SecurityContext] for an http call
  /// to the Kubernetes API; then sends it, using certification details,
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

    request.headers['user-agent'] = ClusterAuthClient.userAgent;
    var context = SecurityContext()
      ..allowLegacyUnsafeRenegotiation = true
      ..setClientAuthoritiesBytes(clientCertificateAuthority);
    if (clientCertificateData.isNotEmpty) {
      context.useCertificateChainBytes(clientCertificateData);
    }
    if (clientKeyData.isNotEmpty) context.usePrivateKeyBytes(clientKeyData);
    var client = HttpClient(context: context)
      ..badCertificateCallback = (_, __, ___) => true;
    return IOClient(client).send(request);
  }
}
