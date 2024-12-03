import 'package:json_annotation/json_annotation.dart';

import 'capabilities.dart';
import 'se_linux_options.dart';
import 'seccomp_profile.dart';
import 'windows_security_context_options.dart';

part 'security_context.g.dart';
/// Represents container-level security configuration in Kubernetes.
///
/// SecurityContext enables fine-grained control over container security settings.
/// Key features include:
/// - Privilege management
/// - Root access control
/// - Filesystem permissions
/// - Security profile configuration
/// - Platform-specific settings
///
/// Common use cases:
/// - Container hardening
/// - Privilege restriction
/// - Root access prevention
/// - Filesystem protection
///
/// Example:
/// ```dart
/// final security = SecurityContext()
///   ..runAsNonRoot = true
///   ..runAsUser = 1000
///   ..readOnlyRootFilesystem = true
///   ..allowPrivilegeEscalation = false
///   ..seccompProfile = (SeccompProfile()
///     ..type = 'RuntimeDefault');
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/)
/// for more details about container security contexts.
@JsonSerializable()
class SecurityContext {
  SecurityContext();

  /// Whether the process can gain more privileges than its parent process.
  /// 
  /// Default: true. Set to false to prevent privilege escalation.
  @JsonKey(includeIfNull: false)
  bool? allowPrivilegeEscalation;

  /// Linux capabilities that can be added to or dropped from the container.
  /// 
  /// Allows fine-grained control over specific Linux capabilities.
  @JsonKey(includeIfNull: false)
  Capabilities? capabilities;

  /// Runs the container in privileged mode.
  /// 
  /// WARNING: Privileged mode grants extensive host access and should be used
  /// with extreme caution.
  @JsonKey(includeIfNull: false)
  bool? privileged;

  /// The type of /proc mount to use for the container.
  /// 
  /// Values:
  /// - 'Default': Regular proc mount
  /// - 'Unmasked': Less secure proc mount with more visibility
  @JsonKey(includeIfNull: false)
  String? procMount;

  /// Whether the root filesystem is mounted read-only.
  /// 
  /// Enhances security by preventing filesystem modifications.
  @JsonKey(includeIfNull: false)
  bool? readOnlyRootFilesystem;

  /// The GID to run the entrypoint of the container process.
  /// 
  /// Specifies the group ID for container processes.
  @JsonKey(includeIfNull: false)
  int? runAsGroup;

  /// Forces the container to run as a non-root user.
  /// 
  /// Enhances security by preventing root user execution.
  @JsonKey(includeIfNull: false)
  bool? runAsNonRoot;

  /// The UID to run the entrypoint of the container process.
  /// 
  /// Specifies the user ID for container processes.
  @JsonKey(includeIfNull: false)
  int? runAsUser;

  /// SELinux options to apply to the container.
  /// 
  /// Configures Security-Enhanced Linux settings.
  @JsonKey(includeIfNull: false)
  SELinuxOptions? seLinuxOptions;

  /// The seccomp profile applied to the container.
  /// 
  /// Controls which system calls the container can make.
  @JsonKey(includeIfNull: false)
  SeccompProfile? seccompProfile;

  /// Windows-specific security options.
  /// 
  /// Only applicable when running containers on Windows nodes.
  @JsonKey(includeIfNull: false)
  WindowsSecurityContextOptions? windowsOptions;

  factory SecurityContext.fromJson(Map<String, dynamic> json) =>
      _$SecurityContextFromJson(json);

  Map<String, dynamic> toJson() => _$SecurityContextToJson(this);
}
