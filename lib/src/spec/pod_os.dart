/// Represents an operating system for a pod.
class PodOS {
  /// The name of the operating system.
  late String name;

  /// Creates a [PodOS] instance from a map of data.
  ///
  /// The map must contain a 'name' key with the operating system name as its value.
  ///
  /// Example:
  /// ```dart
  /// final podOS = PodOS.fromMap({'name': 'linux'});
  /// ```
  PodOS.fromMap(Map<String, dynamic> data) {
    name = data['name'];
  }

  Map<String, dynamic> toMap() => {'name': name};
}
