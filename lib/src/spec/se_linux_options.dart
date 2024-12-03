import 'package:json_annotation/json_annotation.dart';

part 'se_linux_options.g.dart';

/// Represents SELinux security configuration options for containers in Kubernetes.
///
/// SELinuxOptions enables fine-grained access control through Security-Enhanced Linux.
/// Key features include:
/// - User context configuration
/// - Role-based access control
/// - Type enforcement
/// - Multi-level security
///
/// Common use cases:
/// - Container isolation
/// - Access control enforcement
/// - Security policy compliance
/// - Multi-tenant security
///
/// Example:
/// ```dart
/// final seLinux = SELinuxOptions()
///   ..user = 'system_u'
///   ..role = 'system_r'
///   ..type = 'container_t'
///   ..level = 's0:c123,c456';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#assign-selinux-labels-to-a-container)
/// for more details about SELinux configuration.
@JsonSerializable()
class SELinuxOptions {
  SELinuxOptions();

  /// The SELinux level label for Multi-Level Security (MLS).
  /// 
  /// Format: 'sensitivity[:category,...]'
  /// Example: 's0:c123,c456'
  @JsonKey(includeIfNull: false)
  String? level;

  /// The SELinux role label for Role-Based Access Control (RBAC).
  /// 
  /// Common values:
  /// - 'system_r'
  /// - 'user_r'
  /// - 'staff_r'
  @JsonKey(includeIfNull: false)
  String? role;

  /// The SELinux type label for Type Enforcement (TE).
  /// 
  /// Common values:
  /// - 'container_t'
  /// - 'spc_t'
  /// - 'svirt_lxc_net_t'
  @JsonKey(includeIfNull: false)
  String? type;

  /// The SELinux user context.
  /// 
  /// Common values:
  /// - 'system_u'
  /// - 'user_u'
  /// - 'staff_u'
  @JsonKey(includeIfNull: false)
  String? user;

  factory SELinuxOptions.fromJson(Map<String, dynamic> json) =>
      _$SELinuxOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$SELinuxOptionsToJson(this);
}
