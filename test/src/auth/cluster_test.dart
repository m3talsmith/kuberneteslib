import 'dart:convert';
import 'dart:typed_data';

import 'package:kuberneteslib/src/auth/cluster.dart';
import 'package:kuberneteslib/src/cluster/config.dart';
import 'package:kuberneteslib/src/cluster/cluster.dart';
import 'package:kuberneteslib/src/cluster/context.dart';
import 'package:kuberneteslib/src/cluster/user.dart';
import 'package:test/test.dart';

void main() {
  group('ClusterAuth', () {
    test('fromConfig initializes correctly with valid config', () {
      final config = Config(
        currentContext: 'test-context',
        contexts: [
          Context(name: 'test-context', cluster: 'test-cluster', user: 'test-user')
        ],
        clusters: [
          Cluster(
            name: 'test-cluster',
            certificateAuthorityData: base64.encode(utf8.encode('test-ca-data')),
          )
        ],
        users: [
          User(
            name: 'test-user',
            clientCertificateData: base64.encode(utf8.encode('test-cert-data')),
            clientKeyData: base64.encode(utf8.encode('test-key-data')),
          )
        ],
      );

      final auth = ClusterAuth.fromConfig(config);

      expect(auth.cluster, isNotNull);
      expect(auth.user, isNotNull);
      expect(auth.clientCertificateAuthority, isA<Uint8List>());
      expect(auth.clientCertificateData, isA<Uint8List>());
      expect(auth.clientKeyData, isA<Uint8List>());
    });

    test('fromJson/toJson serialization works correctly', () {
      final auth = Cluster(
        name: 'test-cluster',
        certificateAuthorityData: base64.encode(utf8.encode('test-ca-data')),
      );
      
      final json = auth.toJson();
      final deserialized = Cluster.fromJson(json);
      
      expect(deserialized.name, equals(auth.name));
      expect(deserialized.certificateAuthorityData, equals(auth.certificateAuthorityData));
    });
  });
} 