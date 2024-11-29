import 'config_map_key_selector.dart';
import 'object_field_selector.dart';
import 'resource_field_selector.dart';
import 'secret_key_selector.dart';

/// Represents a source for an environment variable in a Kubernetes container.
/// This can reference various Kubernetes resources like ConfigMaps, Secrets,
/// or resource fields.
class EnvVarSource {
  /// Reference to a ConfigMap key
  ConfigMapKeySelector? configMapKeyRef;

  /// Selects a field of the pod
  ObjectFieldSelector? fieldRef;

  /// Selects a resource of the container
  ResourceFieldSelector? resourceFieldRef;

  /// Reference to a Secret key
  SecretKeySelector? secretKeyRef;

  /// Creates an [EnvVarSource] instance from a map structure.
  /// 
  /// The map should contain one of the following keys:
  /// - 'configMapKeyRef': References a ConfigMap key
  /// - 'fieldRef': References a pod field
  /// - 'resourceFieldRef': References a container resource
  /// - 'secretKeyRef': References a Secret key
  EnvVarSource.fromMap(Map<String, dynamic> data) {
    if (data['configMapKeyRef'] != null) {
      configMapKeyRef = ConfigMapKeySelector.fromMap(data['configMapKeyRef']);
    }
    if (data['fieldRef'] != null) {
      fieldRef = ObjectFieldSelector.fromMap(data['fieldRef']);
    }
    if (data['resourceFieldRef'] != null) {
      resourceFieldRef =
          ResourceFieldSelector.fromMap(data['resourceFieldRef']);
    }
    if (data['secretKeyRef'] != null) {
      secretKeyRef = SecretKeySelector.fromMap(data['secretKeyRef']);
    }
  }
}
