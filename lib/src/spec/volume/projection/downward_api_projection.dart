import '../../../spec/volume/downward_api_volume_file.dart';

/// DownwardAPIProjection represents downward API info for projecting into a projected volume.
/// 
/// Note that this is identical to a downwardAPI volume source without the default mode.
class DownwardAPIProjection {
  /// Items is a list of DownwardAPIVolumeFile objects that will be projected
  /// into the volume.
  List<DownwardAPIVolumeFile>? items;

  /// Creates a DownwardAPIProjection from a map of data.
  DownwardAPIProjection.fromMap(Map<String, dynamic> data) {
    if (data['items'] != null) {
      items = [];
      for (var e in data['items']) {
        items!.add(DownwardAPIVolumeFile.fromMap(e));
      }
    }
  }
}
