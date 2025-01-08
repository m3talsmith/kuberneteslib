import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart'
    if (dart.library.io) 'package:http/io_client.dart';
import 'package:http/browser_client.dart'
    if (dart.library.html) 'package:http/browser_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kuberneteslib/src/helpers/uint8list_converter.dart';
import '../cluster/cluster.dart';
import '../cluster/config.dart';
import '../cluster/user.dart';
import 'bearer_client_io.dart' as bearer_client
    if (dart.library.io) 'bearer_client_io.dart'
    if (dart.library.html) 'bearer_client_web.dart';
import 'cert_client.dart' as cert_client;

part 'cluster.g.dart';

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
class ClusterAuth extends http.BaseClient {
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

  factory ClusterAuth.fromJson(Map<String, dynamic> json) =>
      _$ClusterAuthFromJson(json);

  Map<String, dynamic> toJson() => _$ClusterAuthToJson(this);

  /// Sends an HTTP request with appropriate authentication headers and client configuration.
  ///
  /// This method handles both token-based and certificate-based authentication:
  ///
  /// 1. For token-based auth (when [token] is present):
  ///    - Adds bearer token authentication headers
  ///    - Configures SSL/TLS settings for secure communication
  ///
  /// 2. For certificate-based auth:
  ///    - Uses client certificates ([clientCertificateData] and [clientKeyData])
  ///    - Configures certificate authority validation ([clientCertificateAuthority])
  ///
  /// The method automatically adapts to different platforms:
  /// - Native platforms (Linux, macOS, Windows, Android, iOS): Uses [HttpClient] with SSL configuration
  /// - Web platform: Uses [BrowserClient] with appropriate headers
  ///
  /// Example:
  /// ```dart
  /// final request = Request('GET', Uri.parse('https://api.example.com/v1/pods'));
  /// final response = await clusterAuth.send(request);
  /// ```
  ///
  /// @param request The [BaseRequest] to be sent
  /// @return A [Future<StreamedResponse>] containing the server's response
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['User-Agent'] = 'kuberneteslib';

    if (token != null) {
      final options = bearer_client.sendOptions(
        token: token!,
        badCertificateCallback: (_, __, ___) => true,
      );

      for (var option in options.entries) {
        request.headers[option.key] = option.value;
      }

      if (Platform.isLinux ||
          Platform.isMacOS ||
          Platform.isWindows ||
          Platform.isAndroid ||
          Platform.isIOS) {
        final client = HttpClient(context: options['context'])
          ..badCertificateCallback = options['badCertificateCallback'];
        return IOClient(client).send(request);
      }
      return BrowserClient().send(request);
    }

    final options = cert_client.sendOptions(
      clientCertificateAuthority: clientCertificateAuthority!,
      clientCertificateData: clientCertificateData!,
      clientKeyData: clientKeyData!,
      badCertificateCallback: (_, __, ___) => true,
    );

    for (var option in options.entries) {
      request.headers[option.key] = option.value;
    }

    if (Platform.isLinux ||
        Platform.isMacOS ||
        Platform.isWindows ||
        Platform.isAndroid ||
        Platform.isIOS) {
      final client = HttpClient(context: options['context'])
        ..badCertificateCallback = options['badCertificateCallback'];
      return IOClient(client).send(request);
    }
    return BrowserClient().send(request);
  }
}
