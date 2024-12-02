/// A class representing a resource claim.
///
/// Resource claims are used to declare ownership or requirements for specific resources
/// within the system.
class ResourceClaim {
  /// The name identifier of the resource claim.
  ///
  /// This field is required and must be specified when creating a resource claim.
  /// It uniquely identifies the resource being claimed.
  late String name;

  /// Creates a [ResourceClaim] instance from a map representation.
  ///
  /// The [data] map must contain a 'name' key with a string value.
  ///
  /// Parameters:
  ///   data: A map containing the resource claim configuration.
  ///         Must include a 'name' key with a string value.
  ///
  /// Example:
  /// ```dart
  /// final claim = ResourceClaim.fromMap({
  ///   'name': 'my-resource'
  /// });
  /// ```
  ResourceClaim.fromMap(Map<String, dynamic> data) {
    name = data['name'];
  }

  Map<String, dynamic> toMap() => {'name': name};
}
