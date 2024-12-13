import 'downward_api_volume_file.dart';
import 'package:json_annotation/json_annotation.dart';

part 'downward_api_volume_source.g.dart';

dynamic _modeFromJson(dynamic value) {
  if (value is String) {
    return int.parse(value, radix: 8);
  } else if (value is int) {
    return _encodeMode(value);
  }
  return null;
}

dynamic _modeToJson(dynamic mode) {
  if (mode is int) {
    return _decodeMode(mode);
  }
  return mode;
}

int? _encodeMode(dynamic mode) {
  if (mode is int) {
    if (mode > 511) {
      mode = '0${mode.toString()}';
      mode = int.parse(mode, radix: 8);
    }
    return mode;
  } else if (mode is String) {
    return int.parse(mode, radix: 8);
  }
  return null;
}

String? _decodeMode(int? mode) {
  if (mode == null) {
    return null;
  }
  mode = _encodeMode(mode);
  return mode?.toRadixString(8).padLeft(4, '0');
}

List<Map<String, dynamic>>? _itemsToJson(List<DownwardAPIVolumeFile>? items) =>
    items?.map((item) => item.toJson()).toList();

List<DownwardAPIVolumeFile>? _itemsFromJson(List<dynamic>? items) =>
    items?.map((item) => DownwardAPIVolumeFile.fromJson(item)).toList();

/// Represents a volume that exposes pod information as files using Kubernetes Downward API.
///
/// DownwardAPIVolumeSource enables pods to access their own information without
/// coupling to the Kubernetes API. Key features include:
/// - Pod metadata exposure (labels, annotations)
/// - Container resource information
/// - Customizable file permissions
/// - Multiple file configurations
///
/// Common use cases:
/// - Application configuration from pod metadata
/// - Resource monitoring and limits
/// - Dynamic service discovery
///
/// Example:
/// ```dart
/// final downwardAPI = DownwardAPIVolumeSource()
///   ..defaultMode = 0644
///   ..items = [
///     DownwardAPIVolumeFile()
///       ..path = 'labels'
///       ..fieldRef = ObjectFieldSelector()
///         ..fieldPath = 'metadata.labels',
///     DownwardAPIVolumeFile()
///       ..path = 'cpu_limit'
///       ..resourceFieldRef = ResourceFieldSelector()
///         ..resource = 'limits.cpu'
///   ];
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#downwardapi)
/// for more details about Downward API volumes.
@JsonSerializable()
class DownwardAPIVolumeSource {
  DownwardAPIVolumeSource({dynamic defaultMode, this.items})
      : defaultMode = _encodeMode(defaultMode);

  /// Default Unix permission mode for created files.
  /// 
  /// Optional: mode bits used to set permissions on created files by default.
  /// Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511.
  /// 
  /// Common values:
  /// - 0644 (octal) / 420 (decimal): Read/write for owner, read-only for others
  /// - 0600 (octal) / 384 (decimal): Read/write for owner only
  @JsonKey(includeIfNull: false, fromJson: _modeFromJson, toJson: _modeToJson)
  dynamic defaultMode;

  /// List of downward API volume file configurations.
  /// 
  /// Required: Represents the files to be exposed to the container through the downward API.
  /// Each item specifies a file path and the source of data to be exposed.
  @JsonKey(includeIfNull: false, fromJson: _itemsFromJson, toJson: _itemsToJson)
  List<DownwardAPIVolumeFile>? items;

  factory DownwardAPIVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$DownwardAPIVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$DownwardAPIVolumeSourceToJson(this);
}
