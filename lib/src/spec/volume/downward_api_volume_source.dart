import 'downward_api_volume_file.dart';
import 'package:json_annotation/json_annotation.dart';

part 'downward_api_volume_source.g.dart';

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
  DownwardAPIVolumeSource();

  /// Default Unix permission mode for created files.
  /// 
  /// Optional: mode bits used to set permissions on created files by default.
  /// Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511.
  /// 
  /// Common values:
  /// - 0644 (octal) / 420 (decimal): Read/write for owner, read-only for others
  /// - 0600 (octal) / 384 (decimal): Read/write for owner only
  late int defaultMode;

  /// List of downward API volume file configurations.
  /// 
  /// Required: Represents the files to be exposed to the container through the downward API.
  /// Each item specifies a file path and the source of data to be exposed.
  late List<DownwardAPIVolumeFile> items;

  factory DownwardAPIVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$DownwardAPIVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$DownwardAPIVolumeSourceToJson(this);
}
