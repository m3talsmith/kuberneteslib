import 'package:json_annotation/json_annotation.dart';

part 'sysctl.g.dart';

/// Represents a kernel parameter configuration in Kubernetes pods.
///
/// Sysctl enables configuration of kernel parameters at runtime through the pod
/// security context. Key features include:
/// - Kernel parameter modification
/// - Pod-level configuration
/// - Runtime tuning support
/// - Security policy enforcement
///
/// Common use cases:
/// - Network stack tuning
/// - Memory management settings
/// - IPC configurations
/// - Kernel security parameters
///
/// Example:
/// ```dart
/// final sysctl = Sysctl(
///   name: 'net.ipv4.tcp_keepalive_time',
///   value: '600'
/// );
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/tasks/administer-cluster/sysctl-cluster/)
/// for more details about sysctl parameters in pods.
@JsonSerializable()
class Sysctl {
  Sysctl({
    required this.name,
    required this.value,
  });

  /// Name of the kernel parameter.
  /// 
  /// Common examples:
  /// - 'kernel.shm_rmid_forced'
  /// - 'net.ipv4.tcp_syncookies'
  /// - 'vm.swappiness'
  String name;

  /// Value to set for the kernel parameter.
  /// 
  /// Must be a string representation of the desired value.
  /// Examples: '1', '60', '16384'
  String value;

  factory Sysctl.fromJson(Map<String, dynamic> json) => _$SysctlFromJson(json);

  Map<String, dynamic> toJson() => _$SysctlToJson(this);
}
