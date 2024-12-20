import 'package:kuberneteslib/src/spec/pod_resource_claim.dart';
import 'package:kuberneteslib/src/spec/claim_source.dart';
import 'package:test/test.dart';

void main() {
  group('PodResourceClaim', () {
    test('can be instantiated', () {
      final podResourceClaim = PodResourceClaim();
      expect(podResourceClaim, isNotNull);
    });

    test('can be instantiated with name and source', () {
      final podResourceClaim = PodResourceClaim()
        ..name = 'gpu-claim'
        ..source = (ClaimSource()..resourceClaimName = 'shared-gpu');

      expect(podResourceClaim.name, equals('gpu-claim'));
      expect(podResourceClaim.source?.resourceClaimName, equals('shared-gpu'));
    });

    group('JSON serialization', () {
      test('toJson() creates correct JSON', () {
        final podResourceClaim = PodResourceClaim()
          ..name = 'gpu-claim'
          ..source = (ClaimSource()..resourceClaimName = 'shared-gpu');

        final json = podResourceClaim.toJson();

        expect(json, {
          'name': 'gpu-claim',
          'source': {'resourceClaimName': 'shared-gpu'},
        });
      });

      test('fromJson() creates correct object', () {
        final json = {
          'name': 'gpu-claim',
          'source': {'resourceClaimName': 'shared-gpu'},
        };

        final podResourceClaim = PodResourceClaim.fromJson(json);

        expect(podResourceClaim.name, equals('gpu-claim'));
        expect(
            podResourceClaim.source?.resourceClaimName, equals('shared-gpu'));
      });

      test('toJson() excludes null values', () {
        final podResourceClaim = PodResourceClaim();
        final json = podResourceClaim.toJson();

        expect(json, isEmpty);
      });

      test('fromJson() handles empty JSON', () {
        final podResourceClaim = PodResourceClaim.fromJson({});

        expect(podResourceClaim.name, isNull);
        expect(podResourceClaim.source, isNull);
      });
    });
  });
}
