import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';

import 'cluster_auth_client.dart';

class BearerClient extends BaseClient implements ClusterAuthClient {
  BearerClient({required this.token, this.expirationTimestamp});

  final String token;
  final DateTime? expirationTimestamp;

  @override
  Future<StreamedResponse> send(BaseRequest request) {
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
      ..badCertificateCallback = (_, __, ___) => true;
    return IOClient(client).send(request);
  }
}
