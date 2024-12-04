import 'package:json_annotation/json_annotation.dart';

import 'exec.dart';

part 'user.g.dart';

/// Represents a Kubernetes user configuration for cluster authentication.
///
/// This class defines the authentication credentials and methods that can be used
/// to access a Kubernetes cluster. It supports multiple authentication mechanisms:
///
/// 1. Certificate-based authentication:
///    - Using client certificates and private keys
///    - Credentials are stored in PEM format
///
/// 2. External executable authentication:
///    - Using external tools like `doctl`, `aws`, or `gcloud`
///    - Configured through the [exec] property
///
/// Example using certificate authentication:
/// ```dart
/// final user = User(
///   name: 'admin-user',
///   clientCertificateData: 'PEM-encoded-certificate',
///   clientKeyData: 'PEM-encoded-private-key',
/// );
/// ```
///
/// Example using executable authentication:
/// ```dart
/// final user = User(
///   name: 'cloud-user',
///   exec: Exec(
///     command: 'doctl',
///     arguments: ['kubernetes', 'cluster', 'kubeconfig', 'show', 'my-cluster'],
///   ),
/// );
/// ```
///
/// This class is typically used in conjunction with [ClusterAuth] to establish
/// authenticated connections to Kubernetes clusters.
@JsonSerializable()
class User {
  /// Creates a new [User] instance with the specified authentication credentials.
  ///
  /// Parameters:
  /// - [name]: The identifier for this user configuration
  /// - [clientCertificateData]: PEM-encoded certificate for client authentication
  /// - [clientKeyData]: PEM-encoded private key for client authentication
  /// - [exec]: Configuration for executable-based authentication
  User({this.name, this.clientCertificateData, this.clientKeyData, this.exec});

  /// The name identifier for this user configuration.
  /// 
  /// This name is referenced by [Context] configurations to specify which
  /// user credentials to use for cluster authentication.
  @JsonKey(includeIfNull: false, includeToJson: false)
  final String? name;

  /// PEM-encoded certificate data for client certificate authentication.
  /// 
  /// This certificate is presented to the Kubernetes API server to prove
  /// the client's identity. Must be used in conjunction with [clientKeyData].
  @JsonKey(includeIfNull: false, name: 'client-certificate-data')
  final String? clientCertificateData;

  /// PEM-encoded private key data for client certificate authentication.
  /// 
  /// This private key is used to sign requests to the Kubernetes API server.
  /// Must be used in conjunction with [clientCertificateData].
  @JsonKey(includeIfNull: false, name: 'client-key-data')
  final String? clientKeyData;

  /// Configuration for executable-based authentication.
  /// 
  /// When specified, the
  @JsonKey(includeIfNull: false)
  final Exec? exec;

  factory User.fromJson(Map<String, dynamic> json) {
    final userData = json['user'];
    userData['name'] = json['name'];
    final user = _$UserFromJson(userData);
    return user;
  }

  Map<String, dynamic> toJson() {
    final userJson = _$UserToJson(this);
    userJson.remove('name');
    final json = {'user': userJson, 'name': name};
    return json;
  }
}
