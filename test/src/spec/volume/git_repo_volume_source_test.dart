import 'package:test/test.dart';
import 'package:kuberneteslib/src/spec/volume/git_repo_volume_source.dart';

void main() {
  group('GitRepoVolumeSource', () {
    test('can be instantiated', () {
      final source = GitRepoVolumeSource();
      expect(source, isNotNull);
    });

    test('can be created from JSON', () {
      final json = {
        'directory': '/target',
        'repository': 'https://github.com/example/repo.git',
        'revision': 'main',
      };

      final source = GitRepoVolumeSource.fromJson(json);

      expect(source.directory, '/target');
      expect(source.repository, 'https://github.com/example/repo.git');
      expect(source.revision, 'main');
    });

    test('can be converted to JSON', () {
      final source = GitRepoVolumeSource()
        ..directory = '/target'
        ..repository = 'https://github.com/example/repo.git'
        ..revision = 'main';

      final json = source.toJson();

      expect(json, {
        'directory': '/target',
        'repository': 'https://github.com/example/repo.git',
        'revision': 'main',
      });
    });

    test('supports value equality', () {
      final source1 = GitRepoVolumeSource()
        ..directory = '/target'
        ..repository = 'https://github.com/example/repo.git'
        ..revision = 'main';

      final source2 = GitRepoVolumeSource()
        ..directory = '/target'
        ..repository = 'https://github.com/example/repo.git'
        ..revision = 'main';

      expect(source1.toJson(), equals(source2.toJson()));
    });
  });
}
