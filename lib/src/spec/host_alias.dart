import 'package:json_annotation/json_annotation.dart';

part 'host_alias.g.dart';

/// Represents a host alias mapping in Kubernetes pods.
///
/// HostAlias enables custom host-to-IP mappings in a pod's /etc/hosts file.
/// Key features include:
/// - Custom DNS resolution
/// - Multiple hostname mapping
/// - Local name resolution
/// - Network isolation support
///
/// Common use cases:
/// - Local service discovery
/// - Development environments
/// - Legacy application support
/// - DNS override testing
///
/// Example:
/// ```dart
/// final hostAlias = HostAlias()
///   ..ip = '10.0.0.10'
///   ..hostnames = ['my-service.local', 'my-service'];
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/services-networking/add-entries-to-pod-etc-hosts-with-host-aliases/)
/// for more details about host aliases.
@JsonSerializable()
class HostAlias {
  HostAlias()
      : hostnames = [],
        ip = '';

  /// List of hostnames to be mapped to the IP address.
  /// 
  /// Each hostname will resolve to the specified IP address when looked up
  /// from within the pod.
  List<String> hostnames;

  /// The IP address that the hostnames will resolve to.
  /// 
  /// Must be a valid IPv4 or IPv6 address.
  String ip;

  factory HostAlias.fromJson(Map<String, dynamic> json) =>
      _$HostAliasFromJson(json);

  Map<String, dynamic> toJson() => _$HostAliasToJson(this);
}
