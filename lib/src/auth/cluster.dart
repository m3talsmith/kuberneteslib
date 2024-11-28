import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart';

import '../cluster/cluster.dart';
import '../cluster/config.dart';
import '../cluster/exec.dart';
import '../cluster/user.dart';
import 'bearer_client.dart';
import 'cert_client.dart';
import 'cluster_auth_client.dart';

/// [ClusterAuth] is a core class for Kubernetes API authentication. It handles
/// authentication to the Kubernetes API calls and acts as an http wrapper.
///
/// Example Usage:
///
/// ```dart
/// main() async {
///   final config = Config.fromYaml('<kubernetes cluster yaml>');
///   final auth = ClusterAuth.fromConfig(config);
/// }
/// ```
class ClusterAuth {
  Cluster? cluster;
  User? user;
  String? token;
  DateTime? expirationTimestamp;
  Uint8List? clientCertificateAuthority;
  Uint8List? clientCertificateData;
  Uint8List? clientKeyData;
  ClusterAuthClient? client;

  /// fromConfig offers an on-ramp to getting your ClusterAuth off the ground.
  ///
  /// It takes a [config] as an argument and parses the authentication data from
  /// it.
  ///
  /// Example Usage:
  ///
  /// ```dart
  /// main() async {
  ///   final config = Config.fromYaml('<kubernetes cluster yaml>');
  ///   final auth = ClusterAuth.fromConfig(config);
  /// }
  /// ```
  ClusterAuth.fromConfig(Config config) {
    final context =
        config.contexts.firstWhere((e) => e.name == config.currentContext);
    cluster = config.clusters.firstWhere((e) => e.name == context.cluster);
    user = config.users.firstWhere((e) => e.name == context.user);

    clientCertificateAuthority =
        base64Decode(cluster?.certificateAuthorityData ?? '');
    clientCertificateData = base64Decode(user?.clientCertificateData ?? '');
    clientKeyData = base64Decode(user?.clientKeyData ?? '');
  }

  /// ensureInitialization processes any auth related variables and
  /// initializes an [ClusterAuth.client] appropriately.
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
            final result = ExecResult.fromMap(data);
            token = result.status.token;
            expirationTimestamp = result.status.expirationTimestamp;
          }
        }
      }
    }
    client = await _authClient();
  }

  /// An authenticated http wrapper around a get request.
  Future<Response> get(Uri url, {Map<String, String>? headers}) async {
    client ??= await _authClient();
    return client!.get(
      url,
      headers: headers,
    );
  }

  /// An authenticated http wrapper around a post request.
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
    );
  }

  /// An authenticated http wrapper around a put request.
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
    );
  }

  /// An authenticated http wrapper around a patch request.
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
    );
  }

  /// An authenticated http wrapper around a delete request.
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
      body: body,
      encoding: encoding,
    );
  }

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
}
