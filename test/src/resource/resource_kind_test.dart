import 'package:test/test.dart';
import 'package:kuberneteslib/src/resource/resource_kind.dart';

void main() {
  group('ResourceKind', () {
    test('fromString returns correct ResourceKind for valid string', () {
      expect(ResourceKind.fromString('pod'), equals(ResourceKind.pod));
      expect(ResourceKind.fromString('deployment'), equals(ResourceKind.deployment));
      expect(ResourceKind.fromString('service'), equals(ResourceKind.service));
    });

    test('fromString returns unknown for invalid string', () {
      expect(ResourceKind.fromString('nonexistent'), equals(ResourceKind.unknown));
      expect(ResourceKind.fromString(''), equals(ResourceKind.unknown));
    });

    test('sorted excludes unknown and returns sorted list', () {
      final sorted = ResourceKind.sorted();
      expect(sorted, isNot(contains(ResourceKind.unknown)));
    });

    test('ignoreList contains expected kinds', () {
      final ignoreList = ResourceKind.ignoreList;
      expect(ignoreList, contains(ResourceKind.unknown));
      expect(ignoreList, contains(ResourceKind.container));
      expect(ignoreList, contains(ResourceKind.volume));
      expect(ignoreList, contains(ResourceKind.binding));
      expect(ignoreList, equals(ignoreList.toList()..sort((a, b) => a.name.compareTo(b.name))));
    });

    test('ignoreShow contains all ignoreList items plus additional kinds', () {
      final ignoreShow = ResourceKind.ignoreShow;
      expect(ignoreShow, containsAll(ResourceKind.ignoreList));
      expect(ignoreShow, contains(ResourceKind.persistentVolume));
      expect(ignoreShow, equals(ignoreShow.toList()..sort((a, b) => a.name.compareTo(b.name))));
    });

    test('apiReadKinds excludes ignored kinds', () {
      final apiReadKinds = ResourceKind.apiReadKinds;
      for (final ignoredKind in ResourceKind.ignoreList) {
        expect(apiReadKinds, isNot(contains(ignoredKind)));
      }
      expect(apiReadKinds, equals(apiReadKinds.toList()..sort((a, b) => a.name.compareTo(b.name))));
    });
  });
} 