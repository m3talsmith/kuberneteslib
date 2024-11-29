/// A PodReadinessGate represents a condition that must be true for a pod to be ready.
/// It is used to specify additional conditions that must be met before a pod can be
/// considered ready.
class PodReadinessGate {
  /// The type of condition that this gate represents.
  /// This field references a condition in the pod's condition list that must be
  /// true for the pod to be considered ready.
  late String conditionType;

  /// Creates a new PodReadinessGate instance from a map structure.
  /// 
  /// [data] is expected to be a map containing a 'conditionType' key with a string value.
  PodReadinessGate.fromMap(Map<String, dynamic> data) {
    conditionType = data['conditionType'];
  }
}
