import 'dart:io';
import 'dart:typed_data';

class CertClient {
  Map<String, dynamic> sendOptions({
    required Uint8List clientCertificateAuthority,
    required Uint8List clientCertificateData,
    required Uint8List clientKeyData,
    Map<String, String>? headers,
    String? method,
    bool Function(X509Certificate, String, int)? badCertificateCallback,
  }) {
    final options = <String, dynamic>{};
    badCertificateCallback ??= (_, __, ___) => true;

    headers ??= <String, String>{};
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
