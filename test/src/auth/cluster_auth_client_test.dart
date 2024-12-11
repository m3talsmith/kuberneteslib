import 'package:http/http.dart';
import 'package:test/test.dart';
import 'package:kuberneteslib/src/auth/cluster_auth_client.dart';

void main() {
  group('ClusterAuthClient', () {
    late ClusterAuthClient client;

    setUp(() {
      client = ClusterAuthClient();
    });

    group('send', () {
      test('adds user agent header to requests', () async {
        final request = Request('GET', Uri.parse('https://example.com'));
        
        await client.send(request);

        expect(request.headers['User-Agent'], equals(ClusterAuthClient.userAgent));
      });

      test('preserves existing headers when adding user agent', () async {
        final request = Request('GET', Uri.parse('https://example.com'));
        request.headers['Custom-Header'] = 'test-value';
        
        await client.send(request);

        expect(request.headers['User-Agent'], equals(ClusterAuthClient.userAgent));
        expect(request.headers['Custom-Header'], equals('test-value'));
      });
    });

    group('serialization', () {
      test('serializes to json correctly', () {
        final client = ClusterAuthClient();
        final json = client.toJson();
        
        expect(json, isA<Map<String, dynamic>>());
      });

      test('deserializes from json correctly', () {
        final json = <String, dynamic>{};
        final client = ClusterAuthClient.fromJson(json);
        
        expect(client, isA<ClusterAuthClient>());
      });

      test('maintains equality after serialization round trip', () {
        final original = ClusterAuthClient();
        final json = original.toJson();
        final deserialized = ClusterAuthClient.fromJson(json);
        
        expect(deserialized.toJson(), equals(original.toJson()));
      });
    });
  });
} 