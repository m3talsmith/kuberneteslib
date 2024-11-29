/// Represents a projected service account token volume source.
/// 
/// ServiceAccountTokenProjection represents a projected service account token 
/// volume. This projection can be used to insert a service account token into 
/// the pods running with specified path and expiration.
class ServiceAccountTokenProjection {
  /// Optional: Audience is the intended audience of the token.
  /// If not provided, the audience defaults to the API server.
  String? audience;

  /// Optional: Validity duration of the token in seconds.
  /// Defaults to 1 hour if not specified.
  int? expirationSeconds;

  /// Required: The relative path of the file to map the token into.
  String? path;

  /// Creates a new [ServiceAccountTokenProjection] instance from a map structure.
  /// 
  /// [data] is expected to be a map containing the following optional keys:
  /// - 'audience': String value for the token audience
  /// - 'expirationSeconds': Integer value for token expiration time
  /// - 'path': String value for the mount path
  ServiceAccountTokenProjection.fromMap(Map<String, dynamic> data) {
    audience = data['audience'];
    expirationSeconds = data['expirationSeconds'];
    path = data['path'];
  }
}
