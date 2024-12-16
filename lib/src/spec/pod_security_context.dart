import 'package:json_annotation/json_annotation.dart';

import 'se_linux_options.dart';
import 'seccomp_profile.dart';
import 'sysctl.dart';
import 'windows_security_context_options.dart';

part 'pod_security_context.g.dart';

/// Represents security configuration settings that apply to a Pod in Kubernetes.
///
/// PodSecurityContext defines pod-level security attributes and common container settings.
/// Key features include:
/// - User and group ID management
/// - Volume ownership controls
/// - SELinux context configuration
/// - Seccomp profile settings
/// - Windows security options
///
/// Common use cases:
/// - Non-root container execution
/// - Shared storage access control
/// - Security compliance requirements
/// - Container isolation policies
///
/// Example:
/// ```dart
/// final securityContext = PodSecurityContext()
///   ..runAsNonRoot = true
///   ..runAsUser = 1000
///   ..fsGroup = 2000
///   ..supplementalGroups = [3000, 4000]
///   ..seccompProfile = (SeccompProfile()
///     ..type = 'RuntimeDefault');
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/)
/// for more details about Pod security contexts.
@JsonSerializable()
class PodSecurityContext {
  PodSecurityContext();

  /// The GID (Group ID) to be used for all containers in the pod.
  ///
  /// Used for volume access and file permissions when mounting volumes.
  /// Containers will run with this FSGroup unless overridden at container level.
  @JsonKey(includeIfNull: false)
  int? fsGroup;

  /// Defines behavior of changing ownership and permission of the volume.
  ///
  /// Values:
  /// - "OnRootMismatch": Change permissions only if not owned by fsGroup
  /// - "Always": Always change permissions (default)
  @JsonKey(includeIfNull: false)
  String? fsGroupChangePolicy;

  /// The GID (Group ID) to run the entrypoint of container processes.
  ///
  /// Defaults to runtime default if unset. May be overridden by containers.
  @JsonKey(includeIfNull: false)
  int? runAsGroup;

  /// Requires that containers must run as non-root users.
  ///
  /// If true, the Kubelet validates at runtime that container processes
  /// don't run as UID 0 (root).
  @JsonKey(includeIfNull: false)
  bool? runAsNonRoot;

  /// The UID (User ID) to run container processes.
  ///
  /// Defaults to runtime default if unset. May be overridden by containers.
  @JsonKey(includeIfNull: false)
  int? runAsUser;

  /// SELinux context applied to all containers.
  ///
  /// If unspecified, the container runtime allocates a random SELinux context.
  @JsonKey(includeIfNull: false)
  SELinuxOptions? seLinuxOptions;

  /// Seccomp profile applied to all containers.
  ///
  /// Controls which system calls the container processes can make.
  @JsonKey(includeIfNull: false)
  SeccompProfile? seccompProfile;

  /// Additional groups applied to container processes.
  ///
  /// Supplementary groups in addition to the primary GID specified in runAsGroup.
  @JsonKey(includeIfNull: false)
  List<int>? supplementalGroups;

  /// Sysctls applied to the pod.
  ///
  /// List of kernel parameters to be applied to the pod.
  @JsonKey(includeIfNull: false)
  List<Sysctl>? sysctls;

  /// Windows-specific security settings.
  ///
  /// Only applicable when running on Windows nodes.
  @JsonKey(includeIfNull: false)
  WindowsSecurityContextOptions? windowsOptions;

  factory PodSecurityContext.fromJson(Map<String, dynamic> json) =>
      _$PodSecurityContextFromJson(json);

  Map<String, dynamic> toJson() => _$PodSecurityContextToJson(this);
}
