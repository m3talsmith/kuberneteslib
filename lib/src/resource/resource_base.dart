/// Base class for all Kubernetes resource implementations.
///
/// This abstract class serves as the foundation for all Kubernetes resource types,
/// providing common functionality and structure. Resources in Kubernetes are:
/// - Persistent entities in the system (e.g., Pods, Services, ConfigMaps)
/// - Have metadata (name, namespace, labels, etc.)
/// - Can be created, read, updated, and deleted (CRUD operations)
///
/// Example of a concrete implementation:
/// ```dart
/// class Pod extends ResourceBase {
///   Pod() : super();
///
///   // Resource-specific implementation
/// }
/// ```
///
/// This class works in conjunction with [ObjectMeta] and other metadata classes
/// to provide a complete representation of Kubernetes resources.
abstract class ResourceBase {
  /// Creates a new instance of a Kubernetes resource.
  ///
  /// Subclasses should implement their specific initialization logic
  /// while calling this constructor using `super()`.
  ResourceBase();
}
