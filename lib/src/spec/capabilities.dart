import 'package:json_annotation/json_annotation.dart';

part 'capabilities.g.dart';

/// Represents Linux capabilities configuration for Kubernetes containers.
///
/// Capabilities allow fine-grained control over privileged operations that a
/// container can perform. Key features include:
/// - Adding specific capabilities
/// - Dropping specific capabilities
/// - Security policy enforcement
/// - Privilege limitation
///
/// Common use cases:
/// - Network configuration (NET_ADMIN)
/// - System time modification (SYS_TIME)
/// - Filesystem operations (SYS_ADMIN)
/// - Security auditing (AUDIT_CONTROL)
///
/// Example:
/// ```dart
/// final capabilities = Capabilities()
///   ..add = ['NET_ADMIN', 'SYS_TIME']
///   ..drop = ['ALL'];
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-capabilities-for-a-container)
/// for more details about container capabilities.
@JsonSerializable()
class Capabilities {
  Capabilities();

  /// List of capabilities to add to the container.
  ///
  /// Optional: Specifies Linux capabilities to be added to the container.
  /// Common values include: NET_ADMIN, SYS_TIME, SYS_ADMIN
  @JsonKey(includeIfNull: false)
  List<String>? add;

  /// List of capabilities to remove from the container.
  ///
  /// Optional: Specifies Linux capabilities to be removed from the container.
  /// Use ['ALL'] to drop all capabilities.
  @JsonKey(includeIfNull: false)
  List<String>? drop;

  factory Capabilities.fromJson(Map<String, dynamic> json) =>
      _$CapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$CapabilitiesToJson(this);
}
