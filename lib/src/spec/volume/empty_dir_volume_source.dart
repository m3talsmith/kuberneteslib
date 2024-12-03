import '../quantity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'empty_dir_volume_source.g.dart';

/// Represents a temporary directory volume in Kubernetes pods.
///
/// EmptyDirVolumeSource creates an empty directory that exists for the lifetime of
/// the pod. Key features include:
/// - Temporary storage that's deleted when pod terminates
/// - Shared storage between containers in same pod
/// - Optional memory-backed storage
/// - Size limit configuration
///
/// Common use cases:
/// - Scratch space for sorting, merging, processing
/// - Checkpoint storage for long computations
/// - Holding data during multi-step workflows
///
/// Example:
/// ```dart
/// final emptyDir = EmptyDirVolumeSource()
///   ..medium = 'Memory'
///   ..sizeLimit = Quantity.fromString('1Gi');
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#emptydir)
/// for more details about EmptyDir volumes.
@JsonSerializable()
class EmptyDirVolumeSource {
  EmptyDirVolumeSource();

  /// Storage medium backing the directory.
  /// 
  /// Optional: Specifies what type of storage medium should back this directory.
  /// Values:
  /// - "" (empty string): Node's default storage medium
  /// - "Memory": RAM-backed filesystem (tmpfs)
  String? medium;

  /// Total amount of local storage required.
  /// 
  /// Optional: Specifies the maximum size of the empty directory volume.
  /// The directory will be created on the node's storage medium,
  /// either the default medium or memory if specified.
  Quantity? sizeLimit;

  factory EmptyDirVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$EmptyDirVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$EmptyDirVolumeSourceToJson(this);
}
