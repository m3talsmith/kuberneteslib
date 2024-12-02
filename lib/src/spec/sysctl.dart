/// Represents a system control (sysctl) parameter with its name and value.
///
/// This class is typically used to model kernel parameters that can be read
/// or modified through the sysctl interface on Unix-like operating systems.
class Sysctl {
  /// The name of the sysctl parameter.
  late String name;

  /// The value of the sysctl parameter.
  late String value;

  /// Creates a [Sysctl] instance from a Map representation.
  ///
  /// The map must contain 'name' and 'value' keys with their corresponding values.
  ///
  /// Example:
  /// ```dart
  /// final sysctl = Sysctl.fromMap({
  ///   'name': 'kernel.hostname',
  ///   'value': 'my-computer'
  /// });
  /// ```
  Sysctl.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    value = data['value'];
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'value': value,
      };
}
