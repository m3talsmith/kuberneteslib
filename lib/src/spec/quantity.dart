/// Represents a resource quantity in Kubernetes.
///
/// Quantity is used to express resource amounts like CPU, memory, and storage.
/// Key features include:
/// - Resource measurements
/// - Allocation limits
/// - Request specifications
/// - Quota management
///
/// Common use cases:
/// - Container resource limits
/// - Storage requests
/// - CPU allocation
/// - Memory constraints
///
/// Example:
/// ```dart
/// final cpuLimit = Quantity(0.5);  // 500m CPU
/// final memoryRequest = Quantity(256.0);  // 256Mi memory
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)
/// for more details about resource quantities.
typedef Quantity = String?;
