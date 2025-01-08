import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:kuberneteslib/src/auth/cluster.dart';
import 'package:kuberneteslib/src/cluster/config.dart';
import 'package:kuberneteslib/src/cluster/cluster.dart' as k8s;
import 'package:kuberneteslib/src/cluster/context.dart';
import 'package:kuberneteslib/src/cluster/user.dart';
import 'package:test/test.dart';

void main() {
  group('ClusterAuth', () {
    late Config config;
    late ClusterAuth auth;

    setUp(() {
      config = Config(
        currentContext: 'test-context',
        contexts: [
          Context(
            name: 'test-context',
            cluster: 'test-cluster',
            user: 'test-user',
          )
        ],
        clusters: [
          k8s.Cluster(
            name: 'test-cluster',
            certificateAuthorityData:
                base64.encode(utf8.encode('test-ca-data')),
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
      auth = ClusterAuth.fromConfig(config);
    });

    test('fromConfig initializes correctly with valid config', () {
      expect(auth.cluster, isNotNull);
      expect(auth.user, isNotNull);
      expect(auth.clientCertificateAuthority, isA<Uint8List>());
      expect(auth.clientCertificateData, isA<Uint8List>());
      expect(auth.clientKeyData, isA<Uint8List>());

      // Verify decoded certificate data
      expect(
        utf8.decode(auth.clientCertificateAuthority!),
        equals('test-ca-data'),
      );
      expect(
        utf8.decode(auth.clientCertificateData!),
        equals('test-cert-data'),
      );
      expect(
        utf8.decode(auth.clientKeyData!),
        equals('test-key-data'),
      );
    });

    test('fromConfig uses first context when currentContext not found', () {
      final configWithoutCurrentContext = Config(
        contexts: [
          Context(
            name: 'test-context',
            cluster: 'test-cluster',
            user: 'test-user',
          )
        ],
        clusters: [
          k8s.Cluster(
            name: 'test-cluster',
            certificateAuthorityData:
                base64.encode(utf8.encode('test-ca-data')),
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

      final auth = ClusterAuth.fromConfig(configWithoutCurrentContext);
      expect(auth.cluster, isNotNull);
      expect(auth.user, isNotNull);
    });

    test('fromJson/toJson serialization works correctly', () {
      final auth = ClusterAuth(cluster: k8s.Cluster(name: 'test-cluster'))
        ..token = 'test-token'
        ..expirationTimestamp = DateTime.parse('2024-03-14T00:00:00Z')
        ..clientCertificateAuthority =
            Uint8List.fromList(utf8.encode('test-ca'))
        ..clientCertificateData = Uint8List.fromList(utf8.encode('test-cert'))
        ..clientKeyData = Uint8List.fromList(utf8.encode('test-key'));

      final json = auth.toJson();
      final deserialized = ClusterAuth.fromJson(json);

      expect(deserialized.token, equals(auth.token));
      expect(
          deserialized.expirationTimestamp, equals(auth.expirationTimestamp));
      expect(
        deserialized.clientCertificateAuthority,
        equals(auth.clientCertificateAuthority),
      );
      expect(
        deserialized.clientCertificateData,
        equals(auth.clientCertificateData),
      );
      expect(deserialized.clientKeyData, equals(auth.clientKeyData));
    });

    test('send adds User-Agent header to all requests', () async {
      final request = Request('GET', Uri.parse('https://example.com'));
      try {
        await auth.send(request);
      } catch (_) {
        // We expect this to fail since we're not actually connecting
      }
      expect(request.headers['User-Agent'], equals('kuberneteslib'));
    });

    test('send with token authentication adds correct headers', () async {
      auth.token = 'test-token';
      final request = Request('GET', Uri.parse('https://example.com'));

      try {
        await auth.send(request);
      } catch (_) {
        // Expected to fail since we're not actually connecting
      }

      expect(request.headers['Authorization'], equals('Bearer test-token'));
    });

    test('send with expired token throws exception', () async {
      auth.token = 'test-token';
      auth.expirationTimestamp = DateTime.now().subtract(Duration(hours: 1));
      final request = Request('GET', Uri.parse('https://example.com'));

      expect(
        () => auth.send(request),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains('Bearer token is expired'),
        )),
      );
    });

    test('send with certificate authentication sets up correct client',
        () async {
      final request = Request('GET', Uri.parse('https://example.com'));

      try {
        await auth.send(request);
      } catch (_) {
        // Expected to fail since we're not actually connecting
      }

      expect(request.headers['Content-Type'], equals('application/json'));
    });

    test('send with PATCH request sets correct content type', () async {
      final request = Request('PATCH', Uri.parse('https://example.com'));

      try {
        await auth.send(request);
      } catch (_) {
        // Expected to fail since we're not actually connecting
      }

      expect(
        request.headers['Content-Type'],
        equals('application/merge-patch+json'),
      );
    });
  });
}
