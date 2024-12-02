/// Represents an HTTP header with a name and value pair.
class HTTPHeader {
  /// The name of the HTTP header.
  late String name;

  /// The value of the HTTP header.
  late String value;

  /// Creates a new [HTTPHeader] instance from a Map.
  ///
  /// The map must contain 'name' and 'value' keys with their corresponding string values.
  ///
  /// Example:
  /// ```dart
  /// final header = HTTPHeader.fromMap({
  ///   'name': 'Content-Type',
  ///   'value': 'application/json'
  /// });
  /// ```
  HTTPHeader.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    value = data['value'];
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'value': value,
      };
}
