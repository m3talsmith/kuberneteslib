import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import '../cluster/cluster.dart';
import '../cluster/config.dart';
import '../cluster/user.dart';
import '../helpers/uint8list_converter.dart';

import '../helpers/platform.dart' as platform;
import '../helpers/platform_stub.dart'
    if (dart.library.io) '../helpers/platform_io.dart'
    if (dart.library.html) '../helpers/platform_web.dart';
import 'cluster_io.dart' as auth_io if (dart.library.io) 'cluster_io.dart';
import 'cluster_web.dart' as auth_web if (dart.library.html) 'cluster_web.dart';

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
    ClusterAuth ca;

    if (getPlatform() == platform.Platform.web) {
      ca = auth_web.fromConfig(config);
    } else {
      ca = auth_io.fromConfig(config);
    }

    return ClusterAuth(
        cluster: ca.cluster,
        user: ca.user,
        token: ca.token,
        expirationTimestamp: ca.expirationTimestamp,
        clientCertificateAuthority: ca.clientCertificateAuthority,
        clientCertificateData: ca.clientCertificateData,
        clientKeyData: ca.clientKeyData);
  }

  static ClusterAuth fromSelectedContext(Config config, String contextName) {
    ClusterAuth ca;

    if (getPlatform() == platform.Platform.web) {
      ca = auth_web.fromSelectedContext(config, contextName);
    } else {
      ca = auth_io.fromSelectedContext(config, contextName);
    }

    return ClusterAuth(
        cluster: ca.cluster,
        user: ca.user,
        token: ca.token,
        expirationTimestamp: ca.expirationTimestamp,
        clientCertificateAuthority: ca.clientCertificateAuthority,
        clientCertificateData: ca.clientCertificateData,
        clientKeyData: ca.clientKeyData);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (getPlatform() == platform.Platform.web) {
      return auth_web.send(this, request);
    } else {
      return auth_io.send(this, request);
    }
  }

  factory ClusterAuth.fromJson(Map<String, dynamic> json) =>
      _$ClusterAuthFromJson(json);

  Map<String, dynamic> toJson() => _$ClusterAuthToJson(this);
}
