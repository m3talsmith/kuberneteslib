import 'claim_source.dart';

/// Represents a resource claim within a Pod specification.
/// 
/// A PodResourceClaim defines a request for a specific resource that a Pod needs,
/// consisting of a name and a source for the claim.
class PodResourceClaim {
  /// The name of the resource claim.
  late String name;

  /// The source configuration for this resource claim.
  late ClaimSource source;

  /// Creates a [PodResourceClaim] instance from a map structure.
  /// 
  /// [data] should contain:
  /// * 'name': String - the name of the resource claim
  /// * 'source': Map - the source configuration for the claim
  PodResourceClaim.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    source = ClaimSource.fromMap(data['source']);
  }
}
