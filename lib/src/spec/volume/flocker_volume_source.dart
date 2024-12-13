import 'package:json_annotation/json_annotation.dart';

part 'flocker_volume_source.g.dart';

/// Represents a Flocker volume in Kubernetes for container data management.
///
/// FlockerVolumeSource enables pods to use Flocker-managed data volumes.
/// Key features include:
/// - Distributed volume management
/// - Data persistence across container migrations
/// - Dataset identification via UUID
/// - Container-native storage orchestration
///
/// Common use cases:
/// - Stateful applications
/// - Database storage
/// - Containerized data services
///
/// Example:
/// ```dart
/// final flockerVolume = FlockerVolumeSource()
///   ..datasetName = 'mysql-data'
///   ..datasetUUID = 'b4e9d2d8-3719-11e7-be82-0242ac110004';
/// ```
///
/// Note: Flocker is no longer actively maintained.
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/volumes/#flocker)
/// for more details about Flocker volumes.
@JsonSerializable()
class FlockerVolumeSource {
  FlockerVolumeSource();

  /// Name of the Flocker dataset.
  /// 
  /// The dataset name is used as metadata to identify the volume
  /// in the Flocker control service.
  String? datasetName;

  /// Unique identifier for the Flocker dataset.
  /// 
  /// The UUID uniquely identifies a specific dataset in the Flocker cluster.
  /// This ID is used to ensure the correct dataset is mounted.
  String? datasetUUID;

  factory FlockerVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$FlockerVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$FlockerVolumeSourceToJson(this);
}
