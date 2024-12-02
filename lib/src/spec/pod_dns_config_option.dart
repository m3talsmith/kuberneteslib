/// Represents a DNS configuration option for a Pod.
///
/// This class defines a name-value pair for DNS configuration options that can be
/// used in a Pod's DNS configuration.
class PodDNSConfigOption {
  /// The name of the DNS configuration option.
  ///
  /// This field is required and must not be null.
  late String name;

  /// The value associated with the DNS configuration option.
  ///
  /// This field is optional and can be null.
  String? value;

  /// Creates a [PodDNSConfigOption] instance from a Map representation.
  ///
  /// The [data] parameter must be a Map containing at least a 'name' key, and
  /// optionally a 'value' key.
  ///
  /// Example:
  /// ```dart
  /// final option = PodDNSConfigOption.fromMap({
  ///   'name': 'ndots',
  ///   'value': '5'
  /// });
  /// ```
  PodDNSConfigOption.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    value = data['value'];
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'value': value,
      }..removeWhere(
          (key, value) => value == null,
        );
}
