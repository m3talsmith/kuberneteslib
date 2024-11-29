/// Represents a volume source from a Git repository in Kubernetes.
/// 
/// This class defines the configuration needed to mount a Git repository
/// as a volume in a Kubernetes pod.
class GitRepoVolumeSource {
  /// The directory where the repository will be cloned into.
  /// 
  /// This path specifies the target directory within the container
  /// where the Git repository contents will be available.
  late String directory;

  /// The URL of the Git repository to clone.
  /// 
  /// This should be a valid Git repository URL that is accessible
  /// from the cluster (e.g., 'https://github.com/org/repo.git').
  late String repository;

  /// The specific revision (commit hash, branch, or tag) to check out.
  /// 
  /// Examples:
  /// - Commit hash: '1234abc...'
  /// - Branch: 'main'
  /// - Tag: 'v1.0.0'
  late String revision;

  /// Creates a [GitRepoVolumeSource] from a map structure.
  /// 
  /// [data] should contain the following keys:
  /// - 'directory': target directory for the clone
  /// - 'repository': Git repository URL
  /// - 'revision': Git revision to check out
  GitRepoVolumeSource.fromMap(Map<String, dynamic> data) {
    directory = data['directory'];
    repository = data['repository'];
    revision = data['revision'];
  }
}
