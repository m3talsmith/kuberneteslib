/// Represents a host alias mapping between IP addresses and hostnames in Kubernetes.
/// 
/// A host alias allows adding entries to a Pod's /etc/hosts file to provide custom
/// host-to-IP mappings.
class HostAlias {
  /// List of hostnames that will be mapped to the IP address.
  late List<String> hostnames;

  /// The IP address that the hostnames will resolve to.
  late String ip;

  /// Creates a [HostAlias] instance from a map representation.
  /// 
  /// The [data] map must contain:
  /// * 'hostnames': List<String> - The hostnames to map
  /// * 'ip': String - The IP address to map the hostnames to
  HostAlias.fromMap(Map<String, dynamic> data) {
    hostnames = data['hostnames'] as List<String>;
    ip = data['ip'];
  }
}
