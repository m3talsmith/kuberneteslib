import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kuberneteslib/src/helpers/uint8list_converter.dart';
import '../cluster/cluster.dart';
import '../cluster/config.dart';
import '../cluster/exec.dart';
import '../cluster/user.dart';
import 'bearer_client_io.dart'
    if (dart.library.io) 'bearer_client_io.dart'
    if (dart.library.html) 'bearer_client_web.dart';
import 'cert_client_io.dart'
    if (dart.library.io) 'cert_client_io.dart'
    if (dart.library.html) 'cert_client_web.dart';
import 'cluster_auth_client.dart';

part 'cluster_io.g.dart';

/// [ClusterAuth] is a core class for Kubernetes API authentication. It handles
/// authentication to the Kubernetes API calls and acts as an HTTP client wrapper.
///
/// The class supports two authentication methods:
/// 1. Token-based authentication (Bearer tokens)
/// 2. Certificate-based authentication (Client certificates)
///
/// It can be initialized from a Kubernetes configuration and automatically handles
/// token execution and renewal for supported platforms (Linux, macOS, Windows).
///
/// Example Usage:
///
/// ```dart
/// main() async {
///   final config = Config.fromYaml('<kubernetes cluster yaml>');
///   final auth = ClusterAuth.fromConfig(config);
///   await auth.ensureInitialization();
///
///   // Make authenticated requests
///   final response = await auth.get(Uri.parse('https://api.example.com/v1/pods'));
/// }
/// ```
@JsonSerializable()
class ClusterAuth {
  ClusterAuth({required cluster});

  /// The cluster configuration containing server and certificate information
  @JsonKey(includeIfNull: false)
  Cluster? cluster;

  /// The user configuration containing authentication details
  @JsonKey(includeIfNull: false)
  User? user;

  /// Bearer token for token-based authentication
  @JsonKey(includeIfNull: false)
  String? token;

  /// Expiration timestamp for the bearer token
  @JsonKey(includeIfNull: false)
  DateTime? expirationTimestamp;

  /// Certificate authority data for validating the server's certificate
  @JsonKey(includeIfNull: false)
  @Uint8ListConverter()
  Uint8List? clientCertificateAuthority;

  /// Client certificate data for certificate-based authentication
  @JsonKey(includeIfNull: false)
  @Uint8ListConverter()
  Uint8List? clientCertificateData;

  /// Client private key data for certificate-based authentication
  @JsonKey(includeIfNull: false)
  @Uint8ListConverter()
  Uint8List? clientKeyData;

  /// The authenticated HTTP client instance
  @JsonKey(includeIfNull: false)
  ClusterAuthClient? client;

  /// Creates a new [ClusterAuth] instance from a Kubernetes [Config].
  ///
  /// Extracts and decodes the necessary certificate and authentication data from the config.
  /// This includes certificate authority data, client certificates, and private keys.
  ClusterAuth.fromConfig(Config config) {
    final context = config.contexts.firstWhere(
        (e) => (e.name != null && e.name == config.currentContext),
        orElse: () => config.contexts.first);
    cluster = config.clusters.firstWhere(
        (e) => (e.name != null && e.name == context.cluster),
        orElse: () => config.clusters.first);
    user = config.users.firstWhere(
        (e) => (e.name != null && e.name == context.user),
        orElse: () => config.users.first);

    clientCertificateAuthority =
        base64Decode(cluster?.certificateAuthorityData ?? '');
    clientCertificateData = base64Decode(user?.clientCertificateData ?? '');
    clientKeyData = base64Decode(user?.clientKeyData ?? '');
  }

  /// Initializes the authentication client based on the available credentials.
  ///
  /// For supported platforms (Linux, macOS, Windows), if exec-based authentication
  /// is configured, it will execute the specified command to obtain authentication tokens.
  /// Throws an exception if the exec command fails.
  Future<void> ensureInitialization() async {
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      if (user != null && user!.exec != null) {
        final Exec exec = user!.exec!;
        if (exec.command != null && exec.arguments != null) {
          final results = await Process.run(exec.command!, exec.arguments!);

          if (results.exitCode > 0) {
            throw Exception(
              'Auth.ensureInitialization: exec: error: ${results.stderr}',
            );
          }

          final output = results.stdout as String;

          if (output.isNotEmpty) {
            final data = jsonDecode(output);
            final result = ExecResult.fromJson(data);
            token = result.status.token;
            expirationTimestamp = result.status.expirationTimestamp;
          }
        }
      }
    }
    client = await _authClient();
  }

  /// Performs an authenticated HTTP GET request.
  ///
  /// [url] The target URI for the request
  /// [headers] Optional HTTP headers to include in the request
  Future<Response> get(Uri url, {Map<String, String>? headers}) async {
    client ??= await _authClient();
    return client!.get(
      url,
      headers: headers,
    );
  }

  /// Performs an authenticated HTTP POST request.
  ///
  /// [url] The target URI for the request
  /// [headers] Optional HTTP headers to include in the request
  /// [body] The request body
  /// [encoding] The encoding to use for the request body
  Future<Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    client ??= await _authClient();
    return client!.post(
      url,
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  /// Performs an authenticated HTTP PUT request.
  ///
  /// [url] The target URI for the request
  /// [headers] Optional HTTP headers to include in the request
  /// [body] The request body
  /// [encoding] The encoding to use for the request body
  Future<Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    client ??= await _authClient();
    return client!.put(
      url,
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  /// Performs an authenticated HTTP PATCH request.
  ///
  /// [url] The target URI for the request
  /// [headers] Optional HTTP headers to include in the request
  /// [body] The request body
  /// [encoding] The encoding to use for the request body
  Future<Response> patch(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    client ??= await _authClient();
    return client!.patch(
      url,
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  /// Performs an authenticated HTTP DELETE request.
  ///
  /// [url] The target URI for the request
  /// [headers] Optional HTTP headers to include in the request
  /// [body] The request body
  /// [encoding] The encoding to use for the request body
  Future<Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    client ??= await _authClient();
    return client!.delete(
      url,
      headers: headers,
    );
  }

  /// Creates an appropriate authentication client based on available credentials.
  ///
  /// Returns a [BearerClient] if a token is available, otherwise returns a [CertClient].
  Future<ClusterAuthClient> _authClient() async {
    if (token != null) {
      return BearerClient(token: token!);
    }
    return CertClient(
      clientCertificateAuthority: clientCertificateAuthority ?? Uint8List(0),
      clientCertificateData: clientCertificateData ?? Uint8List(0),
      clientKeyData: clientKeyData ?? Uint8List(0),
    );
  }

  factory ClusterAuth.fromJson(Map<String, dynamic> json) =>
      _$ClusterAuthFromJson(json);

  Map<String, dynamic> toJson() => _$ClusterAuthToJson(this);
}
