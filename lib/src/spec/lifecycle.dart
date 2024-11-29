import 'lifecycle_handler.dart';

/// Represents the lifecycle configuration for a container.
///
/// The Lifecycle class defines hooks that can be executed at specific points
/// during a container's lifecycle, specifically after starting (postStart)
/// and before stopping (preStop).
class Lifecycle {
  /// Handler to be executed after the container starts.
  ///
  /// This handler runs asynchronously with respect to the container's main process
  /// and is executed after the container is created.
  LifecycleHandler? postStart;

  /// Handler to be executed before the container stops.
  ///
  /// This handler runs synchronously before the container is terminated,
  /// blocking the container's termination until the handler completes.
  LifecycleHandler? preStop;

  /// Creates a [Lifecycle] instance from a JSON map structure.
  ///
  /// [data] should be a Map containing 'postStart' and/or 'preStop' keys,
  /// each mapping to handler configuration data.
  Lifecycle.fromMap(Map<String, dynamic> data) {
    if (data['postStart'] != null) {
      postStart = LifecycleHandler.fromMap(data['postStart']);
    }
    if (data['preStop'] != null) {
      preStop = LifecycleHandler.fromMap(data['preStop']);
    }
  }
}
