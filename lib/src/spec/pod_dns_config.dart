import 'package:json_annotation/json_annotation.dart';

import 'pod_dns_config_option.dart';

part 'pod_dns_config.g.dart';

/// Represents DNS configuration for a Pod in Kubernetes.
///
/// PodDNSConfig enables customization of DNS settings for pods. Key features include:
/// - Custom nameserver configuration
/// - DNS search domain management
/// - DNS resolver options
/// - Pod-level DNS customization
///
/// Common use cases:
/// - Custom DNS servers
/// - Domain search order
/// - DNS resolution settings
/// - Cross-namespace service discovery
///
/// Example:
/// ```dart
/// final dnsConfig = PodDNSConfig()
///   ..nameservers = ['8.8.8.8', '8.8.4.4']
///   ..searches = ['ns1.svc.cluster.local', 'svc.cluster.local']
///   ..options = [
///     PodDNSConfigOption()
///       ..name = 'ndots'
///       ..value = '5'
///   ];
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)
/// for more details about Pod DNS configuration.
@JsonSerializable()
class PodDNSConfig {
  PodDNSConfig();

  /// List of DNS server IP addresses for the pod.
  /// 
  /// These nameservers are used in the order specified. If this field is empty,
  /// the pod inherits the name server settings from the node.
  /// Example: ['8.8.8.8', '8.8.4.4']
  late List<String> nameservers;

  /// List of DNS resolver options for the pod.
  /// 
  /// Allows fine-grained control over DNS resolution behavior through
  /// name-value pairs. Common options include:
  /// - ndots: minimum number of dots in name for absolute lookup
  /// - timeout: DNS query timeout
  /// - attempts: number of DNS query attempts
  late List<PodDNSConfigOption> options;

  /// List of DNS search domains for hostname lookup in the pod.
  /// 
  /// These search domains are used to expand short names into fully qualified
  /// domain names. They are tried in the order specified.
  /// Example: ['ns1.svc.cluster.local', 'svc.cluster.local', 'cluster.local']
  late List<String> searches;

  factory PodDNSConfig.fromJson(Map<String, dynamic> json) =>
      _$PodDNSConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PodDNSConfigToJson(this);
}
