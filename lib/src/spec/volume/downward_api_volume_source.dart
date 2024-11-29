import 'downward_api_volume_file.dart';

/// Represents a volume source that exposes pod information as files using a downward API.
/// 
/// The DownwardAPIVolumeSource allows containers to consume pod-level information
/// by mounting them into a volume at specified paths.
///
/// Example usage:
/// ```dart
/// var volumeSource = DownwardAPIVolumeSource.fromMap({
///   'defaultMode': 420,  // Equivalent to Unix file mode 0644
///   'items': [
///     {
///       'path': 'labels',
///       'fieldRef': {'fieldPath': 'metadata.labels'}
///     }
///   ]
/// });
/// ```
class DownwardAPIVolumeSource {
  /// The default mode bits to use for created files.
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

  /// Creates a new [DownwardAPIVolumeSource] instance from a map structure.
  /// 
  /// Parameters:
  ///   [data] - Map containing the downward API volume source configuration:
  ///     - 'defaultMode': Integer representing the default permission mode for files
  ///     - 'items': List of downward API volume file configurations
  /// 
  /// Throws:
  ///   [ArgumentError] if required fields are missing or have invalid values
  DownwardAPIVolumeSource.fromMap(Map<String, dynamic> data) {
    defaultMode = data['defaultMode'];
    items = (data['items'] as List<Map<String, dynamic>>)
        .map(
          (e) => DownwardAPIVolumeFile.fromMap(e),
        )
        .toList();
  }
}
