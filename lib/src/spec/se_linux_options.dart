/// Represents SELinux security options for containers.
/// 
/// SELinux (Security-Enhanced Linux) is a Linux kernel security module that provides
/// a mechanism for supporting access control security policies.
class SELinuxOptions {
  /// The SELinux level label that applies to the container.
  String? level;

  /// The SELinux role label that applies to the container.
  String? role;

  /// The SELinux type label that applies to the container.
  String? type;

  /// The SELinux user label that applies to the container.
  String? user;

  /// Creates a new [SELinuxOptions] instance from a map of data.
  /// 
  /// The map should contain string keys corresponding to the SELinux labels:
  /// 'level', 'role', 'type', and 'user'.
  SELinuxOptions.fromMap(Map<String, dynamic> data) {
    level = data['level'];
    role = data['role'];
    type = data['type'];
    user = data['user'];
  }
}
