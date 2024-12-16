import 'package:json_annotation/json_annotation.dart';

import '../../key_to_path.dart';

part 'config_map_projection.g.dart';

/// Adapts a ConfigMap into a projected volume in Kubernetes.
///
/// ConfigMapProjection allows mounting a ConfigMap as a volume in a Pod, with
/// options to:
/// - Project specific keys to specific paths
/// - Control whether the ConfigMap must exist
/// - Map ConfigMap data to files in the volume
///
/// Common use cases:
/// - Mounting application configuration files
/// - Injecting environment-specific settings
/// - Sharing configuration between containers
///
/// Example:
/// ```dart
/// final projection = ConfigMapProjection()
///   ..name = 'app-config'
///   ..items = [
///     KeyToPath()
///       ..key = 'config.json'
///       ..path = 'app/config.json'
///   ]
///   ..optional = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/projected-volumes/#configmap)
/// for more details about ConfigMap projections.
@JsonSerializable()
class ConfigMapProjection {
  ConfigMapProjection();

  /// Optional key-to-path mappings for ConfigMap data.
  ///
  /// If not specified, each key-value pair in the ConfigMap's Data field will be
  /// projected into the volume as a file whose name is the key and content is
  /// the value.
  @JsonKey(includeIfNull: false, toJson: _itemsToJson, fromJson: _itemsFromJson)
  List<KeyToPath>? items;

  /// Name of the ConfigMap to project.
  ///
  /// The ConfigMap must exist in the same namespace as the Pod.
  @JsonKey(includeIfNull: false)
  String? name;

  /// Controls whether the ConfigMap must exist.
  ///
  /// When true, the volume mount will succeed even if the ConfigMap doesn't exist
  /// or has missing keys. Defaults to false.
  @JsonKey(includeIfNull: false)
  bool? optional;

  /// Creates a ConfigMapProjection from a map of data.
  factory ConfigMapProjection.fromMap(Map<String, dynamic> data) =>
      ConfigMapProjection.fromJson(data);

  factory ConfigMapProjection.fromJson(Map<String, dynamic> json) =>
      _$ConfigMapProjectionFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigMapProjectionToJson(this);
}

List<KeyToPath>? _itemsFromJson(List<dynamic>? json) =>
    json?.map((e) => KeyToPath.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>>? _itemsToJson(List<KeyToPath>? items) =>
    items?.map((e) => e.toJson()).toList();
