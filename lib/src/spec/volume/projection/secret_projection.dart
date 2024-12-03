import 'package:json_annotation/json_annotation.dart';
import '../../../spec/key_to_path.dart';

part 'secret_projection.g.dart';

/// Projects Kubernetes Secret data into a volume.
///
/// SecretProjection allows mounting Secret data as files in a Pod's volume.
/// This enables secure access to sensitive information like:
/// - API credentials
/// - TLS certificates
/// - Database passwords
///
/// Common use cases:
/// - Mounting SSL/TLS certificates
/// - Providing API tokens to applications
/// - Injecting sensitive configuration files
///
/// Example:
/// ```dart
/// final projection = SecretProjection()
///   ..name = 'api-credentials'
///   ..items = [
///     KeyToPath()
///       ..key = 'api-key'
///       ..path = 'config/api-key.txt'
///   ]
///   ..optional = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/projected-volumes/#secret)
/// for more details about secret projections.
@JsonSerializable()
class SecretProjection {
  SecretProjection();
  
  /// Optional mappings of Secret keys to specific paths.
  /// 
  /// If not specified, each key-value pair in the Secret's Data field will be
  /// projected as a file using the key as the filename.
  @JsonKey(includeIfNull: false)
  List<KeyToPath>? items; 

  /// Name of the Secret to project.
  /// 
  /// The Secret must exist in the same namespace as the Pod.
  @JsonKey(includeIfNull: false)
  String? name;

  /// Controls whether the Secret must exist.
  /// 
  /// When true, the volume mount will succeed even if the Secret doesn't exist
  /// or has missing keys. Defaults to false.
  @JsonKey(includeIfNull: false)
  bool? optional;

  factory SecretProjection.fromMap(Map<String, dynamic> data) => SecretProjection.fromJson(data);

  factory SecretProjection.fromJson(Map<String, dynamic> json) =>
      _$SecretProjectionFromJson(json);

  Map<String, dynamic> toJson() => _$SecretProjectionToJson(this);
}
