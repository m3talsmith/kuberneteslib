import 'env_var_source.dart';

/// Represents an environment variable in a Kubernetes context.
/// 
/// An [EnvVar] can either have a direct [value] or reference a value from
/// another source via [valueFrom].
class EnvVar {
  /// The name of the environment variable.
  late String name;

  /// The direct value of the environment variable.
  /// 
  /// If [valueFrom] is specified, this should be null.
  String? value;

  /// Reference to the source where the environment variable's value should be taken from.
  /// 
  /// This could be from a ConfigMap, Secret, or other sources supported by Kubernetes.
  /// If [value] is specified, this should be null.
  EnvVarSource? valueFrom;

  /// Creates an [EnvVar] instance from a map structure.
  /// 
  /// The map should contain the following keys:
  /// - 'name': String (required) - name of the environment variable
  /// - 'value': String (optional) - direct value of the environment variable
  /// - 'valueFrom': Map (optional) - source reference for the environment variable value
  EnvVar.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    value = data['value'];
    if (data['valueFrom'] != null) {
      valueFrom = EnvVarSource.fromMap(data['valueFrom']);
    }
  }
}
