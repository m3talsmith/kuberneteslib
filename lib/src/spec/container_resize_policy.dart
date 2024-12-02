/// Represents a policy for container resizing operations.
///
/// This class defines how a container should be resized and what should happen
/// after the resize operation, including the resource to be resized and the
/// restart behavior.
class ContainerResizePolicy {
  /// The name of the resource to be resized.
  late String resourceName;

  /// The policy determining how the container should restart after resizing.
  ///
  /// This could include values like "Always", "Never", or "OnFailure".
  late String restartPolicy;

  /// Creates a [ContainerResizePolicy] instance from a map of values.
  ///
  /// The map must contain the following keys:
  /// * 'resourceName': String identifying the resource to be resized
  /// * 'restartPolicy': String specifying the restart behavior
  ContainerResizePolicy.fromMap(Map<String, dynamic> data) {
    resourceName = data['resourceName'];
    restartPolicy = data['restartPolicy'];
  }

  Map<String, dynamic> toMap() => {
        'resourceName': resourceName,
        'restartPolicy': restartPolicy,
      };
}
