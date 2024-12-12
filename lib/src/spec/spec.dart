import '../helpers/object_spec_converter.dart';
import '../resource/resource_kind.dart';
import 'object_spec.dart';
import 'pod_spec.dart';

/// Factory for creating Kubernetes resource specifications.
///
/// Spec provides a centralized way to create and manage different types of
/// Kubernetes resource specifications. Key features include:
/// - Resource kind-based instantiation
/// - JSON serialization support
/// - Type-safe specification handling
///
/// Common use cases:
/// - Pod specification creation
/// - Resource definition parsing
/// - Multi-resource management
/// - Specification serialization
///
/// Example:
/// ```dart
/// final podSpec = Spec.fromJson({
///   'containers': [{
///     'name': 'web',
///     'image': 'nginx:1.14.2'
///   }]
/// }, kind: ResourceKind.pod);
/// ```
///
/// See the [Kubernetes documentation](https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/)
/// for more details about resource specifications.
class Spec {
  /// The actual resource specification instance.
  /// 
  /// Uses [ObjectSpecConverter] for JSON serialization/deserialization.
  @ObjectSpecConverter()
  ObjectSpec? spec;

  Spec({required this.spec});

  /// Creates a Spec instance from JSON based on the resource kind.
  /// 
  /// Parameters:
  /// - [data]: Raw JSON map containing the specification
  /// - [kind]: Type of Kubernetes resource being created
  /// 
  /// Currently supports:
  /// - Pod specifications (ResourceKind.pod)
  factory Spec.fromJson(Map<String, dynamic> data, {String? kind}) {
    kind ??= (data.containsKey('metadata') && data['metadata']!.containsKey('kind'))
        ? data['metadata']['kind']
        : 'unknown';

    switch (ResourceKind.fromString(kind!)) {
      case ResourceKind.pod:
        return Spec(spec: PodSpec.fromJson(data));
      default:
        return Spec(spec: PodSpec.fromJson(data));
    }
  }

  /// Converts this Spec to a JSON representation.
  Map<String, dynamic> toJson() => spec?.toJson() ?? {};
}
