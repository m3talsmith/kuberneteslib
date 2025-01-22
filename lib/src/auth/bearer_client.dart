import 'dart:io';

class BearerClient {
  Map<String, dynamic> sendOptions({
    required String token,
    Map<String, String>? headers,
    String? method,
    DateTime? expirationTimestamp,
    bool Function(X509Certificate, String, int)? badCertificateCallback,
  }) {
    badCertificateCallback ??= (_, __, ___) => true;

    if (expirationTimestamp != null) {
      final now = DateTime.now();
      if (expirationTimestamp.isBefore(now)) {
        throw Exception('Bearer token is expired');
      }
    }

    final options = <String, dynamic>{};

    headers ??= <String, String>{};
    headers['Authorization'] = 'Bearer $token';
    if (method != null) {
      switch (method.toUpperCase()) {
        case 'PATCH':
          headers['Content-Type'] = 'application/merge-patch+json';
          break;
        default:
          headers['Content-Type'] = 'application/json';
      }
    }
    options['headers'] = headers;
    options['badCertificateCallback'] = badCertificateCallback;
    return options;
  }
}
