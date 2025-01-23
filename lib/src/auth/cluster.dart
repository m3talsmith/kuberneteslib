import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:json_annotation/json_annotation.dart';
import '../cluster/cluster.dart';
import '../cluster/config.dart';
import '../cluster/user.dart';
import '../helpers/uint8list_converter.dart';

part 'cluster.g.dart';

Cluster? _clusterFromJson(Map<String, dynamic>? json) =>
    json == null ? null : Cluster.fromJson(json);

Map<String, dynamic>? _clusterToJson(Cluster? instance) => instance?.toJson();

User? _userFromJson(Map<String, dynamic>? json) =>
    json == null ? null : User.fromJson(json);

Map<String, dynamic>? _userToJson(User? instance) => instance?.toJson();

@JsonSerializable()
class ClusterAuth extends http.BaseClient {
  ClusterAuth(
      {this.cluster,
      this.user,
      this.token,
      this.expirationTimestamp,
      this.clientCertificateAuthority,
      this.clientCertificateData,
      this.clientKeyData});

  @JsonKey(
      includeIfNull: false, fromJson: _clusterFromJson, toJson: _clusterToJson)
  Cluster? cluster;

  @JsonKey(includeIfNull: false, fromJson: _userFromJson, toJson: _userToJson)
  User? user;

  @JsonKey(includeIfNull: false)
  String? token;

  @JsonKey(includeIfNull: false)
  DateTime? expirationTimestamp;

  @JsonKey(includeIfNull: false)
  @Uint8ListConverter()
  Uint8List? clientCertificateAuthority;

  @JsonKey(includeIfNull: false)
  @Uint8ListConverter()
  Uint8List? clientCertificateData;

  @JsonKey(includeIfNull: false)
  @Uint8ListConverter()
  Uint8List? clientKeyData;

  static ClusterAuth fromConfig(Config config) {
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
    final clientCertificateData =
        base64Decode(user.clientCertificateData ?? '');
    final clientKeyData = base64Decode(user.clientKeyData ?? '');

    return ClusterAuth(
        cluster: cluster,
        user: user,
        token: null,
        expirationTimestamp: null,
        clientCertificateAuthority: clientCertificateAuthority,
        clientCertificateData: clientCertificateData,
        clientKeyData: clientKeyData);
  }

  static ClusterAuth fromSelectedContext(Config config, String contextName) {
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
    final clientCertificateData =
        base64Decode(user.clientCertificateData ?? '');
    final clientKeyData = base64Decode(user.clientKeyData ?? '');

    return ClusterAuth(
        cluster: cluster,
        user: user,
        token: null,
        expirationTimestamp: null,
        clientCertificateAuthority: clientCertificateAuthority,
        clientCertificateData: clientCertificateData,
        clientKeyData: clientKeyData);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    badCertificateCallback(_, __, ___) => true;

    if (expirationTimestamp != null) {
      final now = DateTime.now();
      if (expirationTimestamp!.isBefore(now)) {
        throw Exception('Bearer token is expired');
      }
    }

    request.headers['User-Agent'] = 'kuberneteslib';

    switch (request.method.toUpperCase()) {
      case 'PATCH':
        request.headers['Content-Type'] = 'application/merge-patch+json';
        break;
      default:
        request.headers['Content-Type'] = 'application/json';
    }

    if (token != null) {
      request.headers['Authorization'] = 'Bearer $token';
    }

    final context = SecurityContext()..allowLegacyUnsafeRenegotiation = true;
    if (token == null) {
      context.setClientAuthoritiesBytes(clientCertificateAuthority!);
      if (clientCertificateData?.isNotEmpty ?? false) {
        context.useCertificateChainBytes(clientCertificateData!);
      }
      if (clientKeyData?.isNotEmpty ?? false) {
        context.usePrivateKeyBytes(clientKeyData!);
      }
    }
    final client = HttpClient(context: context)
      ..badCertificateCallback = badCertificateCallback;
    return IOClient(client).send(request);
  }

  factory ClusterAuth.fromJson(Map<String, dynamic> json) =>
      _$ClusterAuthFromJson(json);

  Map<String, dynamic> toJson() => _$ClusterAuthToJson(this);
}
