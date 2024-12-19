import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/claim_source.dart';

void main() {
  group('ClaimSource', () {
    test('can be instantiated', () {
      final source = ClaimSource();
      expect(source.resourceClaimName, isNull);
      expect(source.resourceClaimTemplate, isNull);
    });

    test('serializes to JSON', () {
      final source = ClaimSource(
        resourceClaimName: 'test-claim',
        resourceClaimTemplate: 'test-template',
      );

      final json = source.toJson();

      expect(json, {
        'resourceClaimName': 'test-claim',
        'resourceClaimTemplate': 'test-template',
      });
    });

    test('deserializes from JSON', () {
      final json = {
        'resourceClaimName': 'test-claim',
        'resourceClaimTemplate': 'test-template',
      };

      final source = ClaimSource.fromJson(json);

      expect(source.resourceClaimName, 'test-claim');
      expect(source.resourceClaimTemplate, 'test-template');
    });
  });
}
