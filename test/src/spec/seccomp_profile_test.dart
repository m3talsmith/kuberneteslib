import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/seccomp_profile.dart';

void main() {
  group('SeccompProfile', () {
    test('can be instantiated', () {
      final profile = SeccompProfile();
      expect(profile, isNotNull);
    });

    test('supports JSON serialization', () {
      final profile = SeccompProfile()
        ..type = 'RuntimeDefault'
        ..localhostProfile = '/path/to/profile.json';

      final json = profile.toJson();
      expect(json, {
        'type': 'RuntimeDefault',
        'localhostProfile': '/path/to/profile.json',
      });
    });

    test('supports JSON deserialization', () {
      final json = {
        'type': 'Localhost',
        'localhostProfile': '/custom/seccomp/profile.json',
      };

      final profile = SeccompProfile.fromJson(json);
      expect(profile.type, 'Localhost');
      expect(profile.localhostProfile, '/custom/seccomp/profile.json');
    });

    test('handles null values during serialization', () {
      final profile = SeccompProfile();
      final json = profile.toJson();
      expect(json, isEmpty);
    });

    test('creates RuntimeDefault profile', () {
      final profile = SeccompProfile()..type = 'RuntimeDefault';
      expect(profile.type, 'RuntimeDefault');
      expect(profile.localhostProfile, isNull);
    });

    test('creates Localhost profile', () {
      final profile = SeccompProfile()
        ..type = 'Localhost'
        ..localhostProfile = '/path/to/custom/profile.json';

      expect(profile.type, 'Localhost');
      expect(profile.localhostProfile, '/path/to/custom/profile.json');
    });

    test('creates Unconfined profile', () {
      final profile = SeccompProfile()..type = 'Unconfined';
      expect(profile.type, 'Unconfined');
      expect(profile.localhostProfile, isNull);
    });
  });
}
