import 'package:json_annotation/json_annotation.dart';

part 'config_map_key_selector.g.dart';

/// Represents a selector for a specific key within a ConfigMap in Kubernetes.
///
/// ConfigMapKeySelector enables precise selection of individual keys from ConfigMaps.
/// Key features include:
/// - Single key selection
/// - Optional ConfigMap validation
/// - Environment variable mapping
/// - Volume key mapping
///
/// Common use cases:
/// - Individual configuration values
/// - Selective environment variables
/// - Specific file mounting
/// - Credential injection
///
/// Example:
/// ```dart
/// final selector = ConfigMapKeySelector()
///   ..name = 'app-config'
///   ..key = 'database-url'
///   ..optional = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/configmap/#using-configmaps)
/// for more details about ConfigMap key selection.
@JsonSerializable()
class ConfigMapKeySelector {
  ConfigMapKeySelector();

  /// The key to select from the ConfigMap.
  /// 
  /// Required: Specifies which key from the ConfigMap to select.
  /// The value of this key will be used in the context where the selector is defined.
  late String key;

  /// The name of the ConfigMap to select from.
  /// 
  /// Required: References the ConfigMap in the same namespace as the pod
  /// that contains the desired key.
  late String name;

  /// Whether the ConfigMap or key must exist.
  /// 
  /// Required: When true, the pod will start even if the ConfigMap or key
  /// doesn't exist. When false, the pod will fail to start if the ConfigMap
  /// or key is missing.
  late bool optional;

  factory ConfigMapKeySelector.fromJson(Map<String, dynamic> json) =>
      _$ConfigMapKeySelectorFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigMapKeySelectorToJson(this);
}
