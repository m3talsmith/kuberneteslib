import 'package:json_annotation/json_annotation.dart';

part 'glusterfs_volume_source.g.dart';

/// Represents a GlusterFS volume in Kubernetes for distributed file storage.
///
/// GlusterfsVolumeSource enables pods to use GlusterFS volumes. Key features include:
/// - Distributed file system
/// - High availability
/// - Scalable storage
/// - Dynamic volume provisioning
///
/// Common use cases:
/// - Shared file storage
/// - Container persistent storage
/// - Multi-pod data sharing
/// - High-performance workloads
///
/// Example:
/// ```dart
/// final glusterfs = GlusterfsVolumeSource()
///   ..endpoints = 'glusterfs-cluster'
///   ..path = 'myvolume'
///   ..readOnly = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#glusterfs)
/// for more details about GlusterFS volumes.
@JsonSerializable()
class GlusterfsVolumeSource {
  GlusterfsVolumeSource();

  /// The endpoint name that contains GlusterFS pod and service details.
  /// 
  /// Required: References the endpoints object that contains the GlusterFS
  /// cluster network information.
  late String endpoint;

  /// The GlusterFS volume path.
  /// 
  /// Required: The path to the GlusterFS volume that should be mounted.
  /// Example: 'myvolume' or 'myvolume/mydir'.
  late String path;

  /// Controls read-only access to the volume.
  /// 
  /// When true, the volume will be mounted read-only.
  /// Defaults to false (read/write).
  late bool readOnly;

  factory GlusterfsVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$GlusterfsVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$GlusterfsVolumeSourceToJson(this);
}
