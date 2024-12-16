import 'package:json_annotation/json_annotation.dart';

part 'aws_elastic_block_store_volume_source.g.dart';

/// Represents an AWS Elastic Block Store (EBS) volume mounted as a Kubernetes volume.
///
/// AWSElasticBlockStoreVolumeSource enables pods to use AWS EBS volumes for
/// persistent storage. Key features include:
/// - Support for various filesystem types
/// - Optional partition mounting
/// - Read-only mode support
///
/// Common use cases:
/// - Database storage
/// - Shared application state
/// - Data processing workloads
///
/// Example:
/// ```dart
/// final ebsVolume = AWSElasticBlockStoreVolumeSource()
///   ..volumeID = 'vol-1234567890abcdef0'
///   ..fsType = 'ext4'
///   ..partition = 1
///   ..readOnly = false;
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#awselasticblockstore)
/// for more details about AWS EBS volumes.
@JsonSerializable()
class AWSElasticBlockStoreVolumeSource {
  AWSElasticBlockStoreVolumeSource();

  /// The filesystem type to mount on the volume.
  ///
  /// Must be supported by the host operating system.
  /// Common values: "ext4", "xfs", "ntfs"
  late String fsType;

  /// The partition number on the volume to mount.
  ///
  /// If omitted, the default is to mount by volume name.
  late int partition;

  /// Controls read-only access to the volume.
  ///
  /// When true, the volume will be mounted read-only.
  /// Defaults to false (read/write).
  late bool readOnly;

  /// The unique identifier for the EBS volume.
  ///
  /// This ID must correspond to an existing EBS volume in the same AWS region
  /// as the Kubernetes cluster. Format: "vol-xxxxxxxx"
  late String volumeID;

  factory AWSElasticBlockStoreVolumeSource.fromJson(
          Map<String, dynamic> json) =>
      _$AWSElasticBlockStoreVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AWSElasticBlockStoreVolumeSourceToJson(this);
}
