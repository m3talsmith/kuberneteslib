import 'package:kuberneteslib/src/spec/resource_claim.dart';
import 'package:test/test.dart';

void main() {
  group('ResourceClaim', () {
    test('can be instantiated', () {
      final claim = ResourceClaim();
      expect(claim, isNotNull);
    });

    test('can be instantiated with name', () {
      final claim = ResourceClaim()..name = 'test-claim';
      expect(claim.name, equals('test-claim'));
    });

    test('can be converted to JSON', () {
      final claim = ResourceClaim()..name = 'test-claim';

      final json = claim.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['name'], equals('test-claim'));
    });

    test('can be created from JSON', () {
      final json = {'name': 'test-claim'};

      final claim = ResourceClaim.fromJson(json);

      expect(claim, isA<ResourceClaim>());
      expect(claim.name, equals('test-claim'));
    });
  });
}
