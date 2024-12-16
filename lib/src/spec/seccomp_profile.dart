import 'package:json_annotation/json_annotation.dart';

part 'seccomp_profile.g.dart';

/// Represents a seccomp (secure computing) profile configuration in Kubernetes.
///
/// SeccompProfile enables kernel-level system call filtering for containers.
/// Key features include:
/// - System call restrictions
/// - Custom profile support
/// - Runtime default profiles
/// - Granular security control
///
/// Common use cases:
/// - System call filtering
/// - Attack surface reduction
/// - Security policy enforcement
/// - Container hardening
///
/// Example:
/// ```dart
/// final profile = SeccompProfile()
///   ..type = 'RuntimeDefault'
///   ..localhostProfile = 'profiles/custom-seccomp.json';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/tutorials/security/seccomp/)
/// for more details about seccomp profiles.
@JsonSerializable()
class SeccompProfile {
  SeccompProfile();

  /// Path to a custom seccomp profile on the host machine.
  ///
  /// Only used when type is 'Localhost'. The profile must be pre-configured
  /// on each node where the container will run.
  @JsonKey(includeIfNull: false)
  String? localhostProfile;

  /// The type of seccomp profile to apply.
  ///
  /// Values:
  /// - 'RuntimeDefault': Use runtime's default profile
  /// - 'Localhost': Use custom profile from localhostProfile
  /// - 'Unconfined': No system call restrictions
  @JsonKey(includeIfNull: false)
  String? type;

  factory SeccompProfile.fromJson(Map<String, dynamic> json) =>
      _$SeccompProfileFromJson(json);

  Map<String, dynamic> toJson() => _$SeccompProfileToJson(this);
}
