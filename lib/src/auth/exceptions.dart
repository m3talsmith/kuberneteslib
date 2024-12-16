import 'package:kuberneteslib/kuberneteslib.dart';

/// Exception thrown when authentication details are missing.
///
/// This exception is thrown when a function requires authentication credentials
/// to interact with a Kubernetes cluster but the necessary authentication details
/// are not provided. This typically occurs in scenarios such as:
///
/// - Attempting to make authenticated API requests without providing cluster credentials
/// - Missing or invalid authentication configuration in the kubeconfig file
/// - Trying to access secured endpoints without proper authorization setup
///
/// Example:
/// ```dart
/// void makeAuthenticatedRequest(ClusterAuth? auth) {
///   if (auth == null) {
///     throw MissingAuthException();
///   }
///   // Proceed with authenticated request...
/// }
/// ```
///
/// This exception works in conjunction with the [Cluster] configuration to ensure
/// proper authentication when communicating with Kubernetes clusters.
class MissingAuthException implements Exception {}
