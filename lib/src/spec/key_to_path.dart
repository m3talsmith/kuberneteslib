/// A class that represents a mapping between a key, mode, and file path.
/// 
/// This class is typically used to store file system related information
/// where a key is associated with a specific file path and access mode.
class KeyToPath {
  /// The key identifier for this mapping.
  String? key;

  /// The mode value, typically representing file access permissions or states.
  int? mode;

  /// The file system path associated with this key.
  String? path;

  /// Creates a [KeyToPath] instance from a map of values.
  /// 
  /// The map should contain the following keys:
  /// - 'key': String value for the key identifier
  /// - 'mode': Integer value for the mode
  /// - 'path': String value for the file path
  KeyToPath.fromMap(Map<String, dynamic> data) {
    key = data['key'];
    mode = data['mode'];
    path = data['path'];
  }
}
