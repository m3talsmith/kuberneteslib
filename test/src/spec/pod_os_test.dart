import 'package:kuberneteslib/src/spec/pod_os.dart';
import 'package:test/test.dart';

void main() {
  group('PodOS', () {
    test('can be instantiated', () {
      expect(PodOS(), isNotNull);
    });

    group('fromJson', () {
      test('handles empty json', () {
        final podOS = PodOS.fromJson({});
        expect(podOS.name, isNull);
      });

      test('handles name field', () {
        final podOS = PodOS.fromJson({'name': 'linux'});
        expect(podOS.name, equals('linux'));
      });

      test('handles windows OS', () {
        final podOS = PodOS.fromJson({'name': 'windows'});
        expect(podOS.name, equals('windows'));
      });
    });

    group('toJson', () {
      test('excludes null values', () {
        final podOS = PodOS();
        expect(podOS.toJson(), isEmpty);
      });

      test('includes non-null values', () {
        final podOS = PodOS()..name = 'linux';
        expect(podOS.toJson(), equals({'name': 'linux'}));
      });

      test('serializes windows OS correctly', () {
        final podOS = PodOS()..name = 'windows';
        expect(podOS.toJson(), equals({'name': 'windows'}));
      });
    });

    group('field validation', () {
      test('allows linux OS', () {
        final podOS = PodOS()..name = 'linux';
        expect(podOS.name, equals('linux'));
      });

      test('allows windows OS', () {
        final podOS = PodOS()..name = 'windows';
        expect(podOS.name, equals('windows'));
      });

      test('allows null name', () {
        final podOS = PodOS();
        expect(podOS.name, isNull);
      });
    });
  });
}
