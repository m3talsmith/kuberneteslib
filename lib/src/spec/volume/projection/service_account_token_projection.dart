import 'package:json_annotation/json_annotation.dart';

part 'service_account_token_projection.g.dart';

/// Projects a Kubernetes service account token into a volume.
///
/// ServiceAccountTokenProjection enables pods to obtain service account tokens
/// with specific configurations:
/// - Custom audience targeting
/// - Configurable expiration times
/// - Flexible file path mounting
///
/// Common use cases:
/// - Authenticating with external services
/// - Accessing Kubernetes API with custom settings
/// - Implementing token rotation mechanisms
///
/// Example:
/// ```dart
/// final projection = ServiceAccountTokenProjection()
///   ..audience = 'https://my-service.example.com'
///   ..expirationSeconds = 3600
///   ..path = 'tokens/service-account.jwt';
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/projected-volumes/#serviceaccounttoken)
/// for more details about service account token projections.
@JsonSerializable()
class ServiceAccountTokenProjection {
  ServiceAccountTokenProjection();

  /// The intended audience of the token.
  ///
  /// Identifies who should accept this token. If not specified,
  /// the token's audience will default to the Kubernetes API server.
  @JsonKey(includeIfNull: false)
  String? audience;

  /// Token validity duration in seconds.
  ///
  /// Controls how long the projected token will remain valid.
  /// If not specified, defaults to 1 hour (3600 seconds).
  @JsonKey(includeIfNull: false)
  int? expirationSeconds;

  /// The relative path where the token will be mounted.
  ///
  /// Required field that specifies where in the projected volume
  /// the token file should be created.
  @JsonKey(includeIfNull: false)
  String? path;

  /// Creates a new [ServiceAccountTokenProjection] from a map structure.
  factory ServiceAccountTokenProjection.fromMap(Map<String, dynamic> data) =>
      ServiceAccountTokenProjection.fromJson(data);

  factory ServiceAccountTokenProjection.fromJson(Map<String, dynamic> json) =>
      _$ServiceAccountTokenProjectionFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceAccountTokenProjectionToJson(this);
}
