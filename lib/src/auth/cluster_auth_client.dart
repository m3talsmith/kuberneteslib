import 'package:http/http.dart';

/// A base client interface for Kubernetes cluster authentication.
/// 
/// This abstract class extends the http [BaseClient] and defines common
/// functionality for different authentication methods when communicating with
/// a Kubernetes cluster.
///
/// The [ClusterAuthClient] works in conjunction with [ClusterAuth] to provide
/// authenticated HTTP requests to the Kubernetes API. It supports multiple
/// authentication methods including:
/// * Bearer token authentication (via [BearerClient])
/// * Client certificate authentication (via [CertClient])
/// * Basic authentication
///
/// The authentication flow typically works as follows:
/// 1. [ClusterAuth] determines the appropriate authentication method from config
/// 2. [ClusterAuth] creates the appropriate [ClusterAuthClient] implementation
/// 3. All HTTP requests are then made through this authenticated client
/// 
/// Example usage:
/// ```dart
/// final auth = ClusterAuth.fromConfig(config);
/// await auth.ensureInitialization(); // Creates appropriate ClusterAuthClient
/// final response = await auth.get(Uri.parse('https://api.example.com'));
/// ```
abstract class ClusterAuthClient extends BaseClient {
  /// The user agent string that will be sent with all API requests.
  /// 
  /// This helps identify requests coming from this library when examining
  /// server logs or debugging API interactions. The value is fixed as
  /// 'kuberneteslib' for all requests made through this client.
  /// 
  /// This user agent is automatically added to all requests made through
  /// implementations of this class.
  static const String userAgent = 'kuberneteslib';
}
