import '../key_to_path.dart';

/// Adapts a ConfigMap into a volume.
class ConfigMapVolumeSource {
  /// Optional: mode bits used to set permissions on created files by default.
  /// Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511.
  int? defaultMode;

  /// Optional: list of key to path mapping for specific ConfigMap entries.
  List<KeyToPath>? items;

  /// Name of the ConfigMap to use.
  String? name;

  /// Optional: Specify whether the ConfigMap or its keys must be defined.
  bool? optional;

  /// Creates a new [ConfigMapVolumeSource] instance from a map structure.
  ConfigMapVolumeSource.fromMap(Map<String, dynamic> data) {
    defaultMode = data['defaultMode'];
    if (data['items'] != null) {
      items = [];
      for (var e in data['items']) {
        items!.add(KeyToPath.fromMap(e));
      }
    }
    name = data['name'];
    optional = data['optional'];
  }
}
