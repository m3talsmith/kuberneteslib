/// A class representing a Pod scheduling gate in Kubernetes.
///
/// Scheduling gates are used to control when a Pod can be scheduled. A Pod with
/// scheduling gates will not be scheduled until all gates are removed.
class PodSchedulingGate {
  /// The name of the scheduling gate.
  late String name;

  /// Creates a [PodSchedulingGate] instance from a map representation.
  ///
  /// The [data] parameter should be a map containing a 'name' key with a string value.
  ///
  /// Example:
  /// ```dart
  /// final gate = PodSchedulingGate.fromMap({'name': 'my-gate'});
  /// ```
  PodSchedulingGate.fromMap(Map<String, dynamic> data) {
    name = data['name'];
  }

  Map<String, dynamic> toMap() => {'name': name};
}
