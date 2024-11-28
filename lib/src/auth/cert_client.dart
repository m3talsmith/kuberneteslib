import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:http/io_client.dart';

import 'cluster_auth_client.dart';

class CertClient extends BaseClient implements ClusterAuthClient {
  CertClient({
    required this.clientCertificateAuthority,
    required this.clientCertificateData,
    required this.clientKeyData,
  });

  final Uint8List clientCertificateAuthority;
  final Uint8List clientCertificateData;
  final Uint8List clientKeyData;

  @override
  Future<StreamedResponse> send(BaseRequest request) {
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
