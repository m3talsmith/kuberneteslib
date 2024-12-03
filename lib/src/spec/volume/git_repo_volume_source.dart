import 'package:json_annotation/json_annotation.dart';

part 'git_repo_volume_source.g.dart';

/// Represents a Git repository volume source in Kubernetes (deprecated).
///
/// GitRepoVolumeSource enables pods to use Git repositories as volumes.
/// Key features include:
/// - Automatic repository cloning
/// - Branch/tag/commit checkout
/// - Custom target directory
///
/// Note: This volume type is deprecated. Instead, consider using:
/// - EmptyDir + Init Container with git
/// - ConfigMap
/// - Custom volume plugins
///
/// Common use cases:
/// - Configuration files from git
/// - Static web content
/// - Application source code
///
/// Example:
/// ```dart
/// final gitVolume = GitRepoVolumeSource()
///   ..repository = 'https://github.com/kubernetes/kubernetes.git'
///   ..revision = 'main'
///   ..directory = '/src';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#gitrepo)
/// for more details about GitRepo volumes.
@JsonSerializable()
class GitRepoVolumeSource {
  GitRepoVolumeSource();

  /// Target directory for the Git repository.
  /// 
  /// Optional: If omitted, the repository will be cloned into the root directory.
  /// The directory will be created if it doesn't exist.
  late String directory;

  /// Git repository URL to clone.
  /// 
  /// Required: Must be a valid Git repository URL that is accessible from
  /// the Kubernetes cluster.
  late String repository;

  /// Git commit hash, branch, or tag to check out.
  /// 
  /// Optional: If omitted, defaults to 'master'.
  /// Can be any valid Git reference (commit SHA, branch name, tag).
  late String revision;

  factory GitRepoVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$GitRepoVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$GitRepoVolumeSourceToJson(this);
}
