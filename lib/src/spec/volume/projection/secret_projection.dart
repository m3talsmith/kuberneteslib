import '../../../spec/key_to_path.dart';
/// SecretProjection adapts a Secret into a projected volume.
///
/// The contents of the target Secret's Data field will be presented in a
/// projected volume as files using the keys in the Data field as the file names,
/// unless the items element is populated with specific mappings of keys to paths.
class SecretProjection {
  List<KeyToPath>? items;
  String? name;
  bool? optional;
  /// If unspecified, each key-value pair in the Data field of the referenced
  /// Secret will be projected into the volume as a file whose name is the
  /// key and content is the value.
  ///
  /// Name of the referent Secret.
  ///
  /// Optional: Specify whether the Secret or its keys must be defined.
  SecretProjection.fromMap(Map<String, dynamic> data) {
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
