import '../object_field_selector.dart';
import '../resource_field_selector.dart';

/// Represents a file to be created in a volume from downward API information.
/// DownwardAPIVolumeFile enables pods to consume information about themselves
/// or the cluster and expose it to containers through files.
class DownwardAPIVolumeFile {
  /// Selects a field of the pod to populate the volume file with.
  /// Supports metadata.name, metadata.namespace, metadata.labels, metadata.annotations, etc.
  ObjectFieldSelector? fieldRef;

  /// Optional: mode bits used to set permissions on the file.
  /// Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511.
  int? mode;

  /// Required: the relative path of the file to create in the volume.
  /// Must not be absolute or contain the '..' path.
  String? path;

  /// Selects a resource of the container to populate the volume file with.
  /// Supports container resources (CPU and memory) and their limits/requests.
  ResourceFieldSelector? resourceFieldRef;

  /// Creates a new [DownwardAPIVolumeFile] instance from a map structure.
  /// 
  /// The [data] parameter may contain the following keys:
  /// - 'fieldRef': Map containing field selector configuration
  /// - 'mode': Integer representing file permissions
  /// - 'path': String specifying the file path
  /// - 'resourceFieldRef': Map containing resource field selector configuration
  DownwardAPIVolumeFile.fromMap(Map<String, dynamic> data) {
    if (data['fieldRef'] != null) {
      fieldRef = ObjectFieldSelector.fromMap(data['fieldRef']);
    }
    mode = data['mode'];
    path = data['path'];
    if (data['resourceFieldRef'] != null) {
      resourceFieldRef =
          ResourceFieldSelector.fromMap(data['resourceFieldRef']);
    }
  }
}
