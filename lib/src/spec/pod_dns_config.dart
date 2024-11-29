import 'pod_dns_config_option.dart';

/// Represents DNS configuration for a Pod.
///
/// This class defines DNS settings including nameservers, search domains,
/// and additional DNS options for a Kubernetes Pod.
class PodDNSConfig {
  /// List of DNS server IP addresses.
  ///
  /// For example: `['8.8.8.8', '8.8.4.4']`
  late List<String> nameservers;

  /// List of DNS resolver options.
  ///
  /// These options allow for specific DNS configurations through
  /// [PodDNSConfigOption] objects.
  late List<PodDNSConfigOption> options;

  /// List of DNS search domains.
  ///
  /// Search domains are used to expand short hostnames into fully qualified
  /// domain names. For example: `['ns1.svc.cluster.local', 'my.dns.search.suffix']`
  late List<String> searches;

  /// Creates a [PodDNSConfig] instance from a map structure.
  ///
  /// [data] should contain the following keys:
  /// - 'nameservers': List of DNS server IP addresses
  /// - 'options': List of DNS configuration options
  /// - 'searches': List of DNS search domains
  PodDNSConfig.fromMap(Map<String, dynamic> data) {
    nameservers = data['nameservers'] as List<String>;
    options = (data['options'] as List<Map<String, dynamic>>)
        .map(
          (e) => PodDNSConfigOption.fromMap(e),
        )
        .toList();
    searches = data['searches'] as List<String>;
  }
}
