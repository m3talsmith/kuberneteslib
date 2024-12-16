import 'package:json_annotation/json_annotation.dart';

part 'pod_dns_config_option.g.dart';

/// Represents a DNS configuration option for a Pod in Kubernetes.
///
/// PodDNSConfigOption allows customization of DNS settings for a pod through
/// name-value pairs. Key features include:
/// - Custom DNS options
/// - Nameserver configuration
/// - Search domain settings
/// - Resolution parameters
///
/// Common use cases:
/// - Custom DNS timeouts
/// - Search domain configuration
/// - DNS ndots settings
/// - Resolver options
///
/// Example:
/// ```dart
/// final dnsOption = PodDNSConfigOption()
///   ..name = 'ndots'
///   ..value = '5';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)
/// for more details about Pod DNS configuration.
@JsonSerializable()
class PodDNSConfigOption {
  PodDNSConfigOption();

  /// The name of the DNS configuration option.
  ///
  /// Common option names include:
  /// - 'ndots': Number of dots in name to trigger absolute lookup
  /// - 'timeout': DNS query timeout
  /// - 'attempts': Number of DNS query attempts
  /// - 'rotate': Enable round-robin selection of nameservers
  late String name;

  /// The value for the DNS configuration option.
  ///
  /// The interpretation depends on the option name. Examples:
  /// - For 'ndots': A number like "5"
  /// - For 'timeout': Time in seconds
  /// - For 'attempts': Number of retries
  @JsonKey(includeIfNull: false)
  String? value;

  factory PodDNSConfigOption.fromJson(Map<String, dynamic> json) =>
      _$PodDNSConfigOptionFromJson(json);

  Map<String, dynamic> toJson() => _$PodDNSConfigOptionToJson(this);
}
