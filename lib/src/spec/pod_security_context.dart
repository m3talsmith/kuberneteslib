import 'se_linux_options.dart';
import 'seccomp_profile.dart';
import 'sysctl.dart';
import 'windows_security_context_options.dart';

/// Represents security configuration settings that apply to a Pod in Kubernetes.
/// 
/// PodSecurityContext holds pod-level security attributes and common container settings.
/// Some fields are also available at the container level, and in such cases the
/// container-level value will override the pod-level value.
class PodSecurityContext {
  /// The GID (Group ID) to be used for all containers in the pod.
  /// 
  /// This defaults to null. When specified, all containers will run with this FSGroup
  /// unless it is overridden at the container level.
  int? fsGroup;

  /// Defines behavior of changing ownership and permission of the volume.
  /// 
  /// Can be "OnRootMismatch" or "Always". Defaults to "Always".
  String? fsGroupChangePolicy;

  /// The GID (Group ID) to run the entrypoint of the container process.
  /// 
  /// Uses runtime default if unset.
  int? runAsGroup;

  /// Indicates that the container must run as a non-root user.
  /// 
  /// If true, the Kubelet will validate the image at runtime to ensure that it
  /// does not run as UID 0 (root).
  bool? runAsNonRoot;

  /// The UID (User ID) to run the entrypoint of the container process.
  /// 
  /// Uses runtime default if unset.
  int? runAsUser;

  /// The SELinux context to be applied to all containers.
  /// 
  /// If unspecified, the container runtime will allocate a random SELinux context.
  SELinuxOptions? seLinuxOptions;

  /// The seccomp options to be applied to all containers.
  SeccompProfile? seccompProfile;

  /// A list of groups applied to the first process run in each container.
  /// 
  /// These are additional groups relative to the primary GID specified in runAsGroup.
  List<int>? supplementalGroups;

  /// A list of sysctls to be applied to the pod.
  List<Sysctl>? sysctls;

  /// Windows-specific settings applied to all containers.
  WindowsSecurityContextOptions? windowsOptions;

  /// Creates a new [PodSecurityContext] instance from a map structure.
  /// 
  /// This constructor is typically used when deserializing Kubernetes API responses.
  /// 
  /// [data] should be a map containing the security context configuration values.
  PodSecurityContext.fromMap(Map<String, dynamic> data) {
    fsGroup = data['fsGroup'];
    fsGroupChangePolicy = data['fsGroupChangePolicy'];
    runAsGroup = data['runAsGroup'];
    runAsNonRoot = data['runAsNonRoot'];
    runAsUser = data['runAsUser'];
    if (data['seLinuxOptions'] != null) {
      seLinuxOptions = SELinuxOptions.fromMap(data['seLinuxOptions']);
    }
    if (data['seccompProfile'] != null) {
      seccompProfile = SeccompProfile.fromMap(data['seccompProfile']);
    }
    if (data['supplementalGroups'] != null) {
      supplementalGroups = [];
      for (var e in data['supplementalGroups']) {
        supplementalGroups!.add(e);
      }
    }
    if (data['sysctls'] != null) {
      sysctls = [];
      for (var e in data['sysctls']) {
        sysctls!.add(Sysctl.fromMap(e));
      }
    }
    if (data['windowsOptions'] != null) {
      windowsOptions =
          WindowsSecurityContextOptions.fromMap(data['windowsOptions']);
    }
  }
}
