import 'package:http/http.dart';

/// An abstract class that extends the http [BaseClient] and adds a user agent.
abstract class ClusterAuthClient extends BaseClient {
  /// A user agent for the library.
  static const String userAgent = 'kuberneteslib';
}
