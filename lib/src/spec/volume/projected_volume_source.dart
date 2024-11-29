import 'volume_projection.dart';

/// Represents a projected volume source in Kubernetes.
/// 
/// A projected volume maps several existing volume sources into the same directory.
/// This class handles the configuration for such projections.
class ProjectedVolumeSource {
  /// The default mode bits to use for all projections.
  /// 
  /// Optional Unix permission bits that will be applied to all files created
  /// within this projected volume.
  int? defaultMode;

  /// List of volume projections to be mounted.
  /// 
  /// Contains all the volume projections that will be combined
  /// into a single directory.
  List<VolumeProjection>? sources;

  /// Creates a [ProjectedVolumeSource] from a map structure.
  /// 
  /// [data] should be a map containing:
  /// * 'defaultMode': Optional integer representing default Unix permission bits
  /// * 'sources': Optional list of volume projection configurations
  ProjectedVolumeSource.fromMap(Map<String, dynamic> data) {
    defaultMode = data['defaultMode'];
    if (data['sources'] != null) {
      sources = [];
      for (var e in data['sources']) {
        sources!.add(VolumeProjection.fromMap(e));
      }
    }
  }
}
