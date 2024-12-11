import 'package:http/http.dart';
import 'package:test/test.dart';
import 'package:kuberneteslib/src/auth/bearer_client.dart';

void main() {
  group('BearerClient', () {
    late BearerClient client;
    final testToken = 'test-token';

    setUp(() {
      client = BearerClient(token: testToken);
    });

    test('adds correct authorization header', () async {
      final request = Request('GET', Uri.parse('http://example.com'));
      
      // Intercept the request before it's actually sent
      try {
        await client.send(request);
      } catch (_) {
        // Expected to fail since we're not making a real request
      }

      expect(request.headers['Authorization'], equals('Bearer $testToken'));
      expect(request.headers['user-agent'], isNotEmpty);
    });

    test('adds correct content-type header for PATCH requests', () async {
      final request = Request('PATCH', Uri.parse('http://example.com'));
      
      try {
        await client.send(request);
      } catch (_) {}

      expect(request.headers['Content-Type'], 
          equals('application/merge-patch+json'));
    });

    test('adds correct content-type header for non-PATCH requests', () async {
      final request = Request('POST', Uri.parse('http://example.com'));
      
      try {
        await client.send(request);
      } catch (_) {}

      expect(request.headers['Content-Type'], equals('application/json'));
    });

    test('throws exception when token is expired', () {
      final expiredClient = BearerClient(
        token: testToken,
        expirationTimestamp: DateTime.now().subtract(Duration(hours: 1)),
      );

      final request = Request('GET', Uri.parse('http://example.com'));
      
      expect(
        () => expiredClient.send(request),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains('Bearer token is expired'),
        )),
      );
    });

    test('allows requests when token is not expired', () async {
      final validClient = BearerClient(
        token: testToken,
        expirationTimestamp: DateTime.now().add(Duration(hours: 1)),
      );

      final request = Request('GET', Uri.parse('http://example.com'));
      
      // Should not throw expiration exception
      try {
        await validClient.send(request);
      } catch (e) {
        expect(e.toString(), isNot(contains('Bearer token is expired')));
      }
    });

    group('JSON serialization', () {
      test('serializes to JSON correctly', () {
        final timestamp = DateTime.now();
        final client = BearerClient(
          token: testToken,
          expirationTimestamp: timestamp,
        );

        final json = client.toJson();
        
        expect(json['token'], equals(testToken));
        expect(json['expirationTimestamp'], isNotNull);
      });

      test('deserializes from JSON correctly', () {
        final timestamp = DateTime.now();
        final json = {
          'token': testToken,
          'expirationTimestamp': timestamp.toIso8601String(),
        };

        final client = BearerClient.fromJson(json);
        
        expect(client.token, equals(testToken));
        expect(client.expirationTimestamp?.toIso8601String(), 
            equals(timestamp.toIso8601String()));
      });
    });
  });
} 