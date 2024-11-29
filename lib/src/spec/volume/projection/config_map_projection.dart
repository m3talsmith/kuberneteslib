import '../../key_to_path.dart';

/// ConfigMapProjection adapts a ConfigMap into a projected volume.
///
/// The contents of the target ConfigMap's Data field will be presented in a 
/// projected volume as files using the keys in the Data field as the file names,
/// unless the items element is populated with specific mappings of keys to paths.
class ConfigMapProjection {
  /// If unspecified, each key-value pair in the Data field of the referenced
  /// ConfigMap will be projected into the volume as a file whose name is the
  /// key and content is the value.
  List<KeyToPath>? items;

  /// Name of the referent ConfigMap.
  String? name;

  /// Optional: Specify whether the ConfigMap or its keys must be defined.
  bool? optional;

  /// Creates a ConfigMapProjection from a map of data.
  ConfigMapProjection.fromMap(Map<String, dynamic> data) {
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
