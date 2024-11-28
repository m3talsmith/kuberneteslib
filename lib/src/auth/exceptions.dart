import 'package:kuberneteslib/kuberneteslib.dart';

/// MissingAuthException can be thrown when a function that needs a
/// [ClusterAuth] instance, but is missing it.
class MissingAuthException implements Exception {}
