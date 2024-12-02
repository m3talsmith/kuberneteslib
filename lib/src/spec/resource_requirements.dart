import 'resource_claim.dart';

/// Represents the resource requirements for a Kubernetes container or pod.
///
/// This class handles three main types of resource specifications:
/// * Claims: Resource claims for the container/pod
/// * Limits: Maximum resource limits that can be used
/// * Requests: Minimum resource requests that are guaranteed
class ResourceRequirements {
  /// List of resource claims associated with this requirement
  List<ResourceClaim>? claims;

  /// Maximum resource limits, where key is the resource name (e.g., 'cpu', 'memory')
  /// and value is the limit amount
  Map<String, dynamic>? limits;

  /// Minimum resource requests, where key is the resource name (e.g., 'cpu', 'memory')
  /// and value is the requested amount
  Map<String, dynamic>? requests;

  /// Creates a [ResourceRequirements] instance from a map structure.
  ///
  /// The map should contain any of these optional keys:
  /// * 'claims': List of resource claims
  /// * 'limits': Map of resource limits
  /// * 'requests': Map of resource requests
  ///
  /// Example:
  /// ```dart
  /// final requirements = ResourceRequirements.fromMap({
  ///   'limits': {'cpu': '500m', 'memory': '256Mi'},
  ///   'requests': {'cpu': '250m', 'memory': '128Mi'}
  /// });
  /// ```
  ResourceRequirements.fromMap(Map<String, dynamic> data) {
    if (data['claims'] != null) {
      claims = [];
      for (var e in data['claims']) {
        claims!.add(ResourceClaim.fromMap(e));
      }
    }
    if (data['limits'] != null) {
      limits = {};
      for (var e in (data['limits'] as Map<String, dynamic>).entries) {
        limits![e.key] = e.value;
      }
    }
    if (data['requests'] != null) {
      requests = {};
      for (var e in (data['requests'] as Map<String, dynamic>).entries) {
        requests![e.key] = e.value;
      }
    }
  }

  Map<String, dynamic> toMap() => {
        'claims': (claims != null)
            ? claims!.map(
                (e) => e.toMap(),
              )
            : null,
        'limits': limits,
        'requests': requests,
      }..removeWhere(
          (key, value) => value == null,
        );
}
