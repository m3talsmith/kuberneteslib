import 'dart:io';

abstract class BearerClient {
  Map<String, dynamic> sendOptions({
    required String token,
    Map<String, String>? headers,
    String? method,
    DateTime? expirationTimestamp,
    bool Function(X509Certificate, String, int)? badCertificateCallback,
  });
}
