import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import '../cluster/config.dart';

import 'bearer_client_io.dart';
import 'cert_client_io.dart';
import 'cluster.dart' as cluster_auth;

cluster_auth.ClusterAuth fromConfig(Config config) {
  final context = config.contexts.firstWhere(
      (e) => (e.name != null && e.name == config.currentContext),
      orElse: () => config.contexts.first);
  final cluster = config.clusters.firstWhere(
      (e) => (e.name != null && e.name == context.cluster),
      orElse: () => config.clusters.first);
  final user = config.users.firstWhere(
      (e) => (e.name != null && e.name == context.user),
      orElse: () => config.users.first);

  final clientCertificateAuthority =
      base64Decode(cluster.certificateAuthorityData ?? '');
  final clientCertificateData = base64Decode(user.clientCertificateData ?? '');
  final clientKeyData = base64Decode(user.clientKeyData ?? '');

  return cluster_auth.ClusterAuth(
      cluster: cluster,
      user: user,
      clientCertificateAuthority: clientCertificateAuthority,
      clientCertificateData: clientCertificateData,
      clientKeyData: clientKeyData);
}

cluster_auth.ClusterAuth fromSelectedContext(
    Config config, String contextName) {
  final context = config.contexts.firstWhere(
      (e) => (e.name != null && e.name == contextName),
      orElse: () => config.contexts.first);
  final cluster = config.clusters.firstWhere(
      (e) => (e.name != null && e.name == context.cluster),
      orElse: () => config.clusters.first);
  final user = config.users.firstWhere(
      (e) => (e.name != null && e.name == context.user),
      orElse: () => config.users.first);

  final clientCertificateAuthority =
      base64Decode(cluster.certificateAuthorityData ?? '');
  final clientCertificateData = base64Decode(user.clientCertificateData ?? '');
  final clientKeyData = base64Decode(user.clientKeyData ?? '');

  return cluster_auth.ClusterAuth(
      cluster: cluster,
      user: user,
      clientCertificateAuthority: clientCertificateAuthority,
      clientCertificateData: clientCertificateData,
      clientKeyData: clientKeyData);
}

Future<http.StreamedResponse> send(
    cluster_auth.ClusterAuth auth, http.BaseRequest request) {
  request.headers['User-Agent'] = 'kuberneteslib';

  if (auth.token != null) {
    final options = BearerClient().sendOptions(
        token: auth.token!, badCertificateCallback: (_, __, ___) => true);
    options['headers'].forEach((key, value) {
      request.headers[key] = value;
    });

    final securityContext = options['context'];
    final certificateCallback = options['badCertificateCallback'];

    final client = HttpClient(context: securityContext)
      ..badCertificateCallback = certificateCallback;

    return IOClient(client).send(request);
  }

  final options = CertClient().sendOptions(
      clientCertificateAuthority: auth.clientCertificateAuthority!,
      clientCertificateData: auth.clientCertificateData!,
      clientKeyData: auth.clientKeyData!,
      badCertificateCallback: (_, __, ___) => true);

  options['headers'].forEach((key, value) {
    request.headers[key] = value;
  });

  var context = SecurityContext()..allowLegacyUnsafeRenegotiation = true;
  var client = HttpClient(context: context)
    ..badCertificateCallback = options['badCertificateCallback'];

  return IOClient(client).send(request);
}
