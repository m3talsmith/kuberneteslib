import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:kuberneteslib/src/auth/cert_client.dart';
import 'package:test/test.dart';

void main() {
  group('CertClient', () {
    late CertClient client;
    final testCertAuthority = Uint8List.fromList(utf8.encode('test-ca-data'));
    final testCertData = Uint8List.fromList(utf8.encode('test-cert-data'));
    final testKeyData = Uint8List.fromList(utf8.encode('test-key-data'));

    setUp(() {
      client = CertClient(
        clientCertificateAuthority: testCertAuthority,
        clientCertificateData: testCertData,
        clientKeyData: testKeyData,
      );
    });

    test('constructor sets required fields', () {
      expect(client.clientCertificateAuthority, equals(testCertAuthority));
      expect(client.clientCertificateData, equals(testCertData));
      expect(client.clientKeyData, equals(testKeyData));
    });

    test('toJson/fromJson serialization', () {
      final json = client.toJson();
      final deserializedClient = CertClient.fromJson(json);

      expect(deserializedClient.clientCertificateAuthority, equals(testCertAuthority));
      expect(deserializedClient.clientCertificateData, equals(testCertData));
      expect(deserializedClient.clientKeyData, equals(testKeyData));
    });

    test('send sets correct headers for regular requests', () async {
      final request = Request('GET', Uri.parse('https://example.com'));
      
      // This will throw due to invalid certificates, but we can still verify headers
      try {
        await client.send(request);
      } catch (_) {}

      expect(request.headers['user-agent'], equals('kuberneteslib'));
      expect(request.headers['Content-Type'], equals('application/json'));
    });

    test('send sets correct headers for PATCH requests', () async {
      final request = Request('PATCH', Uri.parse('https://example.com'));
      
      // This will throw due to invalid certificates, but we can still verify headers
      try {
        await client.send(request);
      } catch (_) {}

      expect(request.headers['user-agent'], equals('kuberneteslib'));
      expect(request.headers['Content-Type'], equals('application/merge-patch+json'));
    });
  });
} 