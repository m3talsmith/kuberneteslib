import '../quantity.dart';

/// Represents a temporary directory that shares a pod's lifetime.
class EmptyDirVolumeSource {
  /// Optional: What type of storage medium should back this directory.
  /// The default is "" which means to use the node's default medium.
  /// Must be an empty string (default) or Memory.
  String? medium;

  /// Optional: Total amount of local storage required for this EmptyDir volume.
  Quantity? sizeLimit;

  /// Creates a new [EmptyDirVolumeSource] instance from a map structure.
  EmptyDirVolumeSource.fromMap(Map<String, dynamic> data) {
    medium = data['medium'];
    sizeLimit = data['sizeLimit'] as Quantity?;
  }
}
