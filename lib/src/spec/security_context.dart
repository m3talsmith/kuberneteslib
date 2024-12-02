import 'capabilities.dart';
import 'se_linux_options.dart';
import 'seccomp_profile.dart';
import 'windows_security_context_options.dart';

/// Represents security configuration and constraints for a container.
///
/// SecurityContext allows you to control various security-related settings including
/// privilege escalation, capabilities, user/group contexts, and platform-specific
/// security options.
class SecurityContext {
  /// Whether the process can gain more privileges than its parent process.
  bool? allowPrivilegeEscalation;

  /// Linux capabilities that can be added to or dropped from the container.
  Capabilities? capabilities;

  /// Runs the container in privileged mode.
  ///
  /// Privileged mode grants the container nearly all the capabilities of the host system.
  bool? privileged;

  /// Specifies the type of proc mount to use (e.g., 'Default', 'Unmasked').
  String? procMount;

  /// Whether the root filesystem is mounted read-only.
  bool? readOnlyRootFilesystem;

  /// The GID to run the entrypoint of the container process.
  int? runAsGroup;

  /// Forces the container to run as a non-root user.
  bool? runAsNonRoot;

  /// The UID to run the entrypoint of the container process.
  int? runAsUser;

  /// SELinux options to apply to the container.
  SELinuxOptions? seLinuxOptions;

  /// Seccomp profile settings for syscall restriction.
  SeccompProfile? seccompProfile;

  /// Windows-specific security options.
  WindowsSecurityContextOptions? windowsOptions;

  /// Creates a SecurityContext instance from a map of values.
  ///
  /// The map should contain string keys corresponding to the field names
  /// and appropriate values for each security setting.
  SecurityContext.fromMap(Map<String, dynamic> data) {
    allowPrivilegeEscalation = data['allowPrivilegeEscalation'];
    if (data['capabilities'] != null) {
      capabilities = Capabilities.fromMap(data['capabilities']);
    }
    privileged = data['privileged'];
    procMount = data['procMount'];
    readOnlyRootFilesystem = data['readOnlyRootFilesystem'];
    runAsGroup = data['runAsGroup'];
    runAsNonRoot = data['runAsNonRoot'];
    runAsUser = data['runAsUser'];
    if (data['seLinuxOptions'] != null) {
      seLinuxOptions = SELinuxOptions.fromMap(data['seLinuxOptions']);
    }
    if (data['seccompProfile'] != null) {
      seccompProfile = SeccompProfile.fromMap(data['seccompProfile']);
    }
    if (data['windowsOptions'] != null) {
      windowsOptions =
          WindowsSecurityContextOptions.fromMap(data['windowsOptions']);
    }
  }

  Map<String, dynamic> toMap() => {
        'allowPrivilegeEscalation': allowPrivilegeEscalation,
        'capabilities': (capabilities != null) ? capabilities!.toMap() : null,
        'privileged': privileged,
        'procMount': procMount,
        'readOnlyRootFilesystem': readOnlyRootFilesystem,
        'runAsGroup': runAsGroup,
        'runAsNonRoot': runAsNonRoot,
        'runAsUser': runAsUser,
        'seLinuxOptions':
            (seLinuxOptions != null) ? seLinuxOptions!.toMap() : null,
        'seccompProfile':
            (seccompProfile != null) ? seccompProfile!.toMap() : null,
        'windowsOptions':
            (windowsOptions != null) ? windowsOptions!.toMap() : null,
      }..removeWhere(
          (key, value) => value == null,
        );
}
