/// Represents a reference to a local object using its name.
///
/// This class is typically used in Kubernetes configurations to reference
/// objects within the same namespace.
class LocalObjectReference {
  /// The name of the referenced object.
  late String name;

  /// Creates a [LocalObjectReference] from a map structure.
  ///
  /// The map must contain a 'name' key with a string value.
  ///
  /// Parameters:
  ///   - data: A map containing the object reference data
  LocalObjectReference.fromMap(Map<String, dynamic> data) {
    name = data['name'];
  }

  Map<String, dynamic> toMap() => {'name': name};
}
