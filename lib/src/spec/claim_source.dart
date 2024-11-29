/// Represents a claim source configuration for Kubernetes resources.
///
/// This class handles the mapping of resource claims and their templates,
/// typically used in pod specifications for persistent volume claims.
class ClaimSource {
  /// The name of the resource claim.
  late String resourceClaimName;

  /// The template used for the resource claim.
  late String resourceClaimTemplate;

  /// Creates a [ClaimSource] instance from a map of values.
  ///
  /// Parameters:
  ///   - [data]: A map containing 'resourceClaimName' and 'resourceClaimTemplate' keys.
  ClaimSource.fromMap(Map<String, dynamic> data) {
    resourceClaimName = data['resourceClaimName'];
    resourceClaimTemplate = data['resourceClaimTemplate'];
  }
}
