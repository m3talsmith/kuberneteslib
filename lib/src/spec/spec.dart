import '../resource/resource_kind.dart';
import 'pod_spec.dart';

abstract class ObjectSpec {
  ObjectSpec.fromMap(Map<String, dynamic> data, {required ResourceKind kind});
  Map<String, dynamic> toMap();
}

/// A factory class for creating specific resource specifications based on their kind.
class Spec {
  /// Creates a specific Spec instance from a map based on the resource kind.
  ///
  /// [data] is the raw map containing the specification data.
  /// [kind] specifies the type of resource being created.
  ///
  /// Returns a specific spec instance (currently only supports [PodSpec]).
  ///
  /// Example:
  /// ```dart
  /// final podSpec = Spec.fromMap(data, kind: ResourceKind.pod);
  /// ```
  static ObjectSpec fromMap(Map<String, dynamic> data,
      {required ResourceKind kind}) {
    data['kind'] = kind.name;
    switch (kind) {
      case ResourceKind.pod:
        return PodSpec.fromMap(data);
      default:
        return PodSpec.fromMap(data);
    }
  }
}
