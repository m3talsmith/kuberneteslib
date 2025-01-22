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
    throw UnimplementedError();
  }
}
