import 'exec.dart';

class User {
  User({this.name, this.clientCertificateData, this.clientKeyData, this.exec});

  final String? name;
  final String? clientCertificateData;
  final String? clientKeyData;
  final Exec? exec;

  Map<String, dynamic> asMap() => {
        "user": {
          "client-certificate-data": clientCertificateData,
          "client-key-data": clientKeyData,
          "exec": exec?.asMap(),
        },
        "name": name,
      };
}
