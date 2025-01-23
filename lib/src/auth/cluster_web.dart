import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http/browser_client.dart';
import 'package:json_annotation/json_annotation.dart';

import '../helpers/uint8list_converter.dart';
import '../cluster/cluster.dart';
import '../cluster/config.dart';
import '../cluster/user.dart';
import 'bearer_client_web.dart';
import 'cert_client_web.dart';

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
    BearerClient()
        .sendOptions(
      token: auth.token!,
      badCertificateCallback: (_, __, ___) => true,
    )['headers']
        .forEach((key, value) {
      request.headers[key] = value;
    });

    return BrowserClient().send(request);
  }

  CertClient()
      .sendOptions(
    clientCertificateAuthority: auth.clientCertificateAuthority!,
    clientCertificateData: auth.clientCertificateData!,
    clientKeyData: auth.clientKeyData!,
    badCertificateCallback: (_, __, ___) => true,
  )['headers']
      .forEach((key, value) {
    request.headers[key] = value;
  });

  return BrowserClient().send(request);
}
