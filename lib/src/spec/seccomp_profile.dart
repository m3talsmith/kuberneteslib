/// Represents a security computing (seccomp) profile configuration.
///
/// Seccomp profiles are used to restrict the system calls that a container can make,
/// providing an additional layer of security.
class SeccompProfile {
  /// The path to a seccomp profile file on the host machine.
  ///
  /// When specified, this profile will be used to restrict container system calls.
  String? localhostProfile;

  /// The type of seccomp profile to be applied.
  ///
  /// Common values include:
  /// * 'RuntimeDefault' - default profile provided by the container runtime
  /// * 'Unconfined' - no restrictions on system calls
  /// * 'Localhost' - uses a custom profile specified by [localhostProfile]
  String? type;

  /// Creates a [SeccompProfile] instance from a map of values.
  ///
  /// The map should contain keys:
  /// * 'localhostProfile' - path to profile file (optional)
  /// * 'type' - type of seccomp profile (optional)
  SeccompProfile.fromMap(Map<String, dynamic> data) {
    localhostProfile = data['localhostProfile'];
    type = data['type'];
  }

  Map<String, dynamic> toMap() => {
        'localhostProfile': localhostProfile,
        'type': type,
      }..removeWhere(
          (key, value) => value == null,
        );
}
