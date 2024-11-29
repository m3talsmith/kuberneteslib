import 'package:kuberneteslib/kuberneteslib.dart';

/// Exception thrown when authentication details are missing.
///
/// This exception is thrown when a function requires a [ClusterAuth] instance
/// but none was provided. This typically occurs when attempting to make
/// authenticated requests without proper initialization of the authentication
/// system.
class MissingAuthException implements Exception {}
