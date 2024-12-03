import 'package:json_annotation/json_annotation.dart';

import 'volume_projection.dart';


part 'projected_volume_source.g.dart';

/// Represents a projected volume in Kubernetes for combining multiple volume sources.
///
/// ProjectedVolumeSource enables pods to combine multiple volume sources into a
/// single directory. Key features include:
/// - Multiple source types support
/// - Unified access to different volumes
/// - Configurable permissions
/// - Dynamic updates
///
/// Supported volume types for projection:
/// - Secrets
/// - ConfigMaps
/// - DownwardAPI
/// - ServiceAccountToken
///
/// Common use cases:
/// - Application credentials
/// - Runtime configuration
/// - Pod metadata access
/// - Combined configuration sources
///
/// Example:
/// ```dart
/// final projectedVolume = ProjectedVolumeSource()
///   ..defaultMode = 0644
///   ..sources = [
///     VolumeProjection()
///       ..secret = SecretProjection()
///       ..configMap = ConfigMapProjection()
///       ..downwardAPI = DownwardAPIProjection()
///       ..serviceAccountToken = ServiceAccountTokenProjection()
///   ];
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/projected-volumes/)
/// for more details about projected volumes.
@JsonSerializable()
class ProjectedVolumeSource {
  ProjectedVolumeSource();

  /// Default permission mode for all projected files.
  /// 
  /// Optional: Defaults to 0644 (rw-r--r--).
  /// Represents Unix permission bits in octal notation.
  /// Must be a value between 0 and 0777.
  @JsonKey(includeIfNull: false)
  int? defaultMode;

  /// List of volume projections to combine.
  /// 
  /// Required: Contains the volume sources to project into a single directory.
  /// Sources can include Secrets, ConfigMaps, DownwardAPI, and ServiceAccountTokens.
  @JsonKey(includeIfNull: false)
  List<VolumeProjection>? sources;

  factory ProjectedVolumeSource.fromJson(Map<String, dynamic> json) =>
      _$ProjectedVolumeSourceFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectedVolumeSourceToJson(this);
}
