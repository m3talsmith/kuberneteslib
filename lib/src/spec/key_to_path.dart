import 'package:json_annotation/json_annotation.dart';

part 'key_to_path.g.dart';

/// Represents a key to file path mapping in Kubernetes.
///
/// KeyToPath enables mapping between ConfigMap or Secret keys and their
/// corresponding file paths in a volume mount. Key features include:
/// - Key-to-file mapping
/// - File permissions control
/// - Path customization
/// - Volume mount integration
///
/// Common use cases:
/// - ConfigMap file mounting
/// - Secret file mounting
/// - Custom file permissions
/// - Selective key mounting
///
/// Example:
/// ```dart
/// final keyToPath = KeyToPath()
///   ..key = 'config.json'
///   ..path = 'app/config.json'
///   ..mode = 0644;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#configmap)
/// for more details about ConfigMap and Secret volume mounting.
@JsonSerializable()
class KeyToPath {
  KeyToPath();

  /// The key from the ConfigMap or Secret.
  ///
  /// Required: The key that you want to map to a file path.
  /// This key must exist in the ConfigMap or Secret being referenced.
  @JsonKey(includeIfNull: false)
  String? key;

  /// The file mode bits to use on the file.
  ///
  /// Optional: Defaults to 0644.
  /// Must be an octal value between 0 and 0777.
  /// Can be used to set custom permissions on the mounted file.
  @JsonKey(includeIfNull: false)
  int? mode;

  /// The relative path of the file to create in the volume.
  ///
  /// Required: The path where the file will be created in the volume.
  /// Must not contain '..' and must not start with '..'.
  @JsonKey(includeIfNull: false)
  String? path;

  factory KeyToPath.fromJson(Map<String, dynamic> json) =>
      _$KeyToPathFromJson(json);

  Map<String, dynamic> toJson() => _$KeyToPathToJson(this);
}
