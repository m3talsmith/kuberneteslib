import 'package:json_annotation/json_annotation.dart';

part 'secret_key_selector.g.dart';

/// Represents a selector for specific keys within Kubernetes Secrets.
///
/// SecretKeySelector enables precise referencing of individual secret values.
/// Key features include:
/// - Single key selection
/// - Optional secret handling
/// - Granular secret access
/// - Error handling control
///
/// Common use cases:
/// - Individual credential access
/// - Specific API key retrieval
/// - Certificate selection
/// - Token management
///
/// Example:
/// ```dart
/// final selector = SecretKeySelector()
///   ..name = 'app-secrets'
///   ..key = 'database-password'
///   ..optional = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/secret/#using-secrets)
/// for more details about accessing Secret keys.
@JsonSerializable()
class SecretKeySelector {
  SecretKeySelector();

  /// The key to select from the secret.
  ///
  /// Must be a valid key name in the referenced secret.
  /// Common examples: 'username', 'password', 'api-key', 'tls.crt'
  @JsonKey(includeIfNull: false)
  String? key;

  /// Name of the secret containing the key.
  ///
  /// The secret must exist in the same namespace as the pod
  /// referencing this selector.
  @JsonKey(includeIfNull: false)
  String? name;

  /// Controls whether the secret and key must exist.
  ///
  /// When true:
  /// - Missing secrets or keys won't cause errors
  /// - Returns null if secret or key not found
  /// When false (default):
  /// - Missing secrets or keys will cause errors
  /// - Pod startup fails if secret or key not found
  @JsonKey(includeIfNull: false)
  bool? optional;

  factory SecretKeySelector.fromJson(Map<String, dynamic> json) =>
      _$SecretKeySelectorFromJson(json);

  Map<String, dynamic> toJson() => _$SecretKeySelectorToJson(this);
}
