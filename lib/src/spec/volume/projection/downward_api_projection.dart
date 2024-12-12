import 'package:json_annotation/json_annotation.dart';

import '../../../spec/volume/downward_api_volume_file.dart';

part 'downward_api_projection.g.dart';

/// Projects Kubernetes downward API information into a volume.
///
/// DownwardAPIProjection allows pods to expose their information to containers through
/// files in a projected volume. This enables containers to access:
/// - Pod metadata (labels, annotations)
/// - Pod specs (resource limits, requests)
/// - Pod status information
///
/// Common use cases:
/// - Exposing pod name and namespace to applications
/// - Making resource limits available to monitoring tools
/// - Passing metadata to application configuration
///
/// Example:
/// ```dart
/// final projection = DownwardAPIProjection()
///   ..items = [
///     DownwardAPIVolumeFile()
///       ..path = 'labels'
///       ..fieldRef = ObjectFieldSelector()
///         ..fieldPath = 'metadata.labels'
///   ];
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/projected-volumes/#downwardapi)
/// for more details about downward API projections.

List<Map<String, dynamic>>? _itemsToJson(List<DownwardAPIVolumeFile>? items) =>
    items?.map((item) => item.toJson()).toList();

List<DownwardAPIVolumeFile>? _itemsFromJson(List<dynamic>? items) =>
    items?.map((item) => DownwardAPIVolumeFile.fromJson(item)).toList();

@JsonSerializable()
class DownwardAPIProjection {
  DownwardAPIProjection({this.items});

  /// List of files to project into the volume.
  /// 
  /// Each item specifies a mapping between a source of pod data and its desired
  /// location within the projected volume. Sources can include:
  /// - Pod metadata fields
  /// - Container resource fields (CPU, memory)
  @JsonKey(includeIfNull: false, toJson: _itemsToJson, fromJson: _itemsFromJson)
  List<DownwardAPIVolumeFile>? items;

  factory DownwardAPIProjection.fromJson(Map<String, dynamic> json) =>
      _$DownwardAPIProjectionFromJson(json);

  Map<String, dynamic> toJson() => _$DownwardAPIProjectionToJson(this);
}
