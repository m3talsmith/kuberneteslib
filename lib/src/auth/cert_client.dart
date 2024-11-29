import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:http/io_client.dart';

import 'cluster_auth_client.dart';

/// A client that implements certificate-based authentication for Kubernetes.
///
/// This client uses X.509 client certificates to authenticate requests to
/// the Kubernetes API.
class CertClient extends BaseClient implements ClusterAuthClient {
  /// Creates a new certificate client.
  ///
  /// [clientCertificateAuthority] - The CA certificate data
  /// [clientCertificateData] - The client certificate data
  /// [clientKeyData] - The client private key data
  CertClient({
    required this.clientCertificateAuthority,
    required this.clientCertificateData,
    required this.clientKeyData,
  });

  /// The certificate authority data
  final Uint8List clientCertificateAuthority;
  
  /// The client certificate data
  final Uint8List clientCertificateData;
  
  /// The client private key data  
  final Uint8List clientKeyData;

  /// Sends an HTTP request with certificate authentication.
  ///
  /// Configures the SSL/TLS context with the certificate data and handles
  /// certificate validation. The [badCertificateCallback] can be used to
  /// customize certificate validation behavior.
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
