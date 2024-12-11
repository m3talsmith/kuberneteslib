import 'package:test/test.dart';
import 'package:kuberneteslib/src/cluster/cluster.dart';

void main() {
  group('Cluster', () {
    test('creates instance with all properties', () {
      final cluster = Cluster(
        name: 'test-cluster',
        server: 'https://api.test.com:6443',
        certificateAuthorityData: 'dGVzdC1jZXJ0LWRhdGE=', // base64 encoded "test-cert-data"
      );

      expect(cluster.name, equals('test-cluster'));
      expect(cluster.server, equals('https://api.test.com:6443'));
      expect(cluster.certificateAuthorityData, equals('dGVzdC1jZXJ0LWRhdGE='));
    });

    test('creates instance with null properties', () {
      final cluster = Cluster();

      expect(cluster.name, isNull);
      expect(cluster.server, isNull);
      expect(cluster.certificateAuthorityData, isNull);
    });

    group('JSON serialization', () {
      test('fromJson correctly deserializes nested cluster data', () {
        final json = {
          'name': 'test-cluster',
          'cluster': {
            'server': 'https://api.test.com:6443',
            'certificate-authority-data': 'dGVzdC1jZXJ0LWRhdGE=',
          },
        };

        final cluster = Cluster.fromJson(json);

        expect(cluster.name, equals('test-cluster'));
        expect(cluster.server, equals('https://api.test.com:6443'));
        expect(cluster.certificateAuthorityData, equals('dGVzdC1jZXJ0LWRhdGE='));
      });

      test('toJson correctly serializes to nested format', () {
        final cluster = Cluster(
          name: 'test-cluster',
          server: 'https://api.test.com:6443',
          certificateAuthorityData: 'dGVzdC1jZXJ0LWRhdGE=',
        );

        final json = cluster.toJson();

        expect(json, equals({
          'name': 'test-cluster',
          'cluster': {
            'server': 'https://api.test.com:6443',
            'certificate-authority-data': 'dGVzdC1jZXJ0LWRhdGE=',
          },
        }));
      });

      test('toJson excludes null values', () {
        final cluster = Cluster(
          name: 'test-cluster',
          server: 'https://api.test.com:6443',
          // certificateAuthorityData intentionally omitted
        );

        final json = cluster.toJson();

        expect(json, equals({
          'name': 'test-cluster',
          'cluster': {
            'server': 'https://api.test.com:6443',
          },
        }));
      });
    });

    group('edge cases', () {
      test('fromJson handles empty cluster data', () {
        final json = {
          'name': 'test-cluster',
          'cluster': {},
        };

        final cluster = Cluster.fromJson(json);

        expect(cluster.name, equals('test-cluster'));
        expect(cluster.server, isNull);
        expect(cluster.certificateAuthorityData, isNull);
      });

      test('fromJson handles malformed certificate data', () {
        final json = {
          'name': 'test-cluster',
          'cluster': {
            'server': 'https://api.test.com:6443',
            'certificate-authority-data': '', // empty string
          },
        };

        final cluster = Cluster.fromJson(json);
        expect(cluster.certificateAuthorityData, isEmpty);
      });

      test('equality comparison', () {
        final cluster1 = Cluster(
          name: 'test-cluster',
          server: 'https://api.test.com:6443',
          certificateAuthorityData: 'dGVzdC1jZXJ0LWRhdGE=',
        );

        final cluster2 = Cluster(
          name: 'test-cluster',
          server: 'https://api.test.com:6443',
          certificateAuthorityData: 'dGVzdC1jZXJ0LWRhdGE=',
        );

        final cluster3 = Cluster(
          name: 'different-cluster',
          server: 'https://api.test.com:6443',
          certificateAuthorityData: 'dGVzdC1jZXJ0LWRhdGE=',
        );

        // While not strictly equal (no operator== override), 
        // they should have the same properties
        expect(cluster1.name, equals(cluster2.name));
        expect(cluster1.server, equals(cluster2.server));
        expect(cluster1.certificateAuthorityData, equals(cluster2.certificateAuthorityData));

        expect(cluster1.name, isNot(equals(cluster3.name)));
      });
    });

    group('validation', () {
      test('server URL format', () {
        final validUrls = [
          'https://api.test.com:6443',
          'https://localhost:6443',
          'http://internal-api:8080',
          'https://192.168.1.1:6443',
        ];

        for (final url in validUrls) {
          final cluster = Cluster(
            name: 'test-cluster',
            server: url,
          );
          expect(cluster.server, equals(url));
        }
      });

      test('certificate authority data format', () {
        // Test with valid base64 encoded data
        final validBase64 = 'dGVzdC1jZXJ0LWRhdGE=';
        final cluster = Cluster(
          name: 'test-cluster',
          certificateAuthorityData: validBase64,
        );
        expect(cluster.certificateAuthorityData, equals(validBase64));
      });
    });

    group('complex scenarios', () {
      test('multiple clusters with same server different certs', () {
        final cluster1 = Cluster(
          name: 'prod-cluster',
          server: 'https://api.test.com:6443',
          certificateAuthorityData: 'cert1',
        );

        final cluster2 = Cluster(
          name: 'staging-cluster',
          server: 'https://api.test.com:6443',
          certificateAuthorityData: 'cert2',
        );

        expect(cluster1.server, equals(cluster2.server));
        expect(cluster1.certificateAuthorityData, isNot(equals(cluster2.certificateAuthorityData)));
      });

      test('serialization roundtrip', () {
        final original = Cluster(
          name: 'test-cluster',
          server: 'https://api.test.com:6443',
          certificateAuthorityData: 'dGVzdC1jZXJ0LWRhdGE=',
        );

        final json = original.toJson();
        final deserialized = Cluster.fromJson(json);

        expect(deserialized.name, equals(original.name));
        expect(deserialized.server, equals(original.server));
        expect(deserialized.certificateAuthorityData, equals(original.certificateAuthorityData));
      });
    });
  });
} 