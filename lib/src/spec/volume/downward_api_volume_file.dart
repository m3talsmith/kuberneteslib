import 'package:json_annotation/json_annotation.dart';

import '../object_field_selector.dart';
import '../resource_field_selector.dart';

part 'downward_api_volume_file.g.dart';

/// Represents a file that exposes pod or container information in Kubernetes volumes.
///
/// DownwardAPIVolumeFile enables containers to access information about themselves
/// or their environment through files. Key features include:
/// - Access to pod metadata (name, namespace, labels, annotations)
/// - Container resource information (CPU, memory limits/requests)
/// - Custom file permissions
/// - Flexible path mounting
///
/// Common use cases:
/// - Exposing pod metadata to applications
/// - Resource monitoring and logging
/// - Dynamic configuration based on pod attributes
///
/// Example:
/// ```dart
/// final volumeFile = DownwardAPIVolumeFile()
///   ..path = 'labels'
///   ..fieldRef = ObjectFieldSelector()
///     ..fieldPath = 'metadata.labels'
///   ..mode = 0644;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#downwardapi)
/// for more details about Downward API volumes.

Map<String, dynamic>? _fieldRefToJson(ObjectFieldSelector? fieldRef) =>
    fieldRef?.toJson();

ObjectFieldSelector? _fieldRefFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ObjectFieldSelector.fromJson(json);

Map<String, dynamic>? _resourceFieldRefToJson(ResourceFieldSelector? ref) =>
    ref?.toJson();

ResourceFieldSelector? _resourceFieldRefFromJson(Map<String, dynamic>? json) =>
    json == null ? null : ResourceFieldSelector.fromJson(json);

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

@JsonSerializable()
class DownwardAPIVolumeFile {
  DownwardAPIVolumeFile(
      {this.fieldRef, dynamic mode, this.path, this.resourceFieldRef})
      : mode = _encodeMode(mode);

  /// Selects a field from the pod's metadata.
  ///
  /// Supports various pod metadata fields including:
  /// - metadata.name: Pod name
  /// - metadata.namespace: Pod namespace
  /// - metadata.labels: Pod labels
  /// - metadata.annotations: Pod annotations
  @JsonKey(
      includeIfNull: false,
      toJson: _fieldRefToJson,
      fromJson: _fieldRefFromJson)
  ObjectFieldSelector? fieldRef;

  /// Unix permission mode for the created file.
  ///
  /// Must be an octal value between 0000 and 0777 or
  /// a decimal value between 0 and 511.
  /// Example: 0644 (rw-r--r--)
  @JsonKey(includeIfNull: false, fromJson: _modeFromJson, toJson: _modeToJson)
  dynamic mode;

  /// Path where the file will be created in the volume.
  ///
  /// Must be a relative path, cannot contain '..' or
  /// start with '/'. Example: "pod/labels"
  @JsonKey(includeIfNull: false)
  String? path;

  /// Selects a container resource metric to expose.
  ///
  /// Can reference:
  /// - CPU limits and requests
  /// - Memory limits and requests
  /// - Storage limits and requests
  @JsonKey(
      includeIfNull: false,
      toJson: _resourceFieldRefToJson,
      fromJson: _resourceFieldRefFromJson)
  ResourceFieldSelector? resourceFieldRef;

  factory DownwardAPIVolumeFile.fromJson(Map<String, dynamic> json) =>
      _$DownwardAPIVolumeFileFromJson(json);

  Map<String, dynamic> toJson() => _$DownwardAPIVolumeFileToJson(this);
}
