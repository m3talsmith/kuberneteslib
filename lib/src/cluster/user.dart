import 'exec.dart';

/// Represents a Kubernetes user configuration, containing authentication
/// credentials and execution parameters for cluster access.
class User {
  User({this.name, this.clientCertificateData, this.clientKeyData, this.exec});

  /// The name of the user in the Kubernetes configuration
  final String? name;

  /// PEM-encoded certificate data for client authentication
  final String? clientCertificateData;

  /// PEM-encoded private key data associated with the client certificate
  final String? clientKeyData;

  /// Configuration for executable-based authentication
  /// Used primarily with tools like `doctl` for authentication
  final Exec? exec;

  /// Turns the [User] into a form that can be serialized
  Map<String, dynamic> asMap() => {
        "user": {
          "client-certificate-data": clientCertificateData,
          "client-key-data": clientKeyData,
          "exec": exec?.asMap(),
        },
        "name": name,
      };
}
